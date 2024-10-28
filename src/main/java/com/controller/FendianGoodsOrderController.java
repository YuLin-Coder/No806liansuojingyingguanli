package com.controller;


import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.StringUtil;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import com.entity.FendianGoodsOrderEntity;

import com.service.FendianGoodsOrderService;
import com.entity.view.FendianGoodsOrderView;
import com.service.HuiyuanService;
import com.entity.HuiyuanEntity;
import com.service.FendianGoodsOrderListService;
import com.entity.FendianGoodsOrderListEntity;
import com.service.YonghuService;
import com.entity.YonghuEntity;
import com.service.FendianGoodsService;
import com.entity.FendianGoodsEntity;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 购买订单
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
 */
@RestController
@Controller
@RequestMapping("/fendianGoodsOrder")
public class FendianGoodsOrderController {
    private static final Logger logger = LoggerFactory.getLogger(FendianGoodsOrderController.class);

    @Autowired
    private FendianGoodsOrderService fendianGoodsOrderService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;



    //级联表service
    @Autowired
    private HuiyuanService huiyuanService;
    // 列表详情的表级联service
    @Autowired
    private FendianGoodsOrderListService fendianGoodsOrderListService;
    @Autowired
    private YonghuService yonghuService;
    @Autowired
    private FendianGoodsService fendianGoodsService;


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(StringUtil.isNotEmpty(role) && "用户".equals(role)){
            YonghuEntity yonghuEntity = yonghuService.selectById(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
            params.put("fendianId",yonghuEntity.getFendianId());
        }
        params.put("orderBy","id");
        PageUtils page = fendianGoodsOrderService.queryPage(params);

        //字典表数据转换
        List<FendianGoodsOrderView> list =(List<FendianGoodsOrderView>)page.getList();
        for(FendianGoodsOrderView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c);
        }
        return R.ok().put("data", page);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        FendianGoodsOrderEntity fendianGoodsOrder = fendianGoodsOrderService.selectById(id);
        if(fendianGoodsOrder !=null){
            //entity转view
            FendianGoodsOrderView view = new FendianGoodsOrderView();
            BeanUtils.copyProperties( fendianGoodsOrder , view );//把实体数据重构到view中

            //级联表
            HuiyuanEntity huiyuan = huiyuanService.selectById(fendianGoodsOrder.getHuiyuanId());
            if(huiyuan != null){
                BeanUtils.copyProperties( huiyuan , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setHuiyuanId(huiyuan.getId());
            }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody FendianGoodsOrderEntity fendianGoodsOrder, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,fendianGoodsOrder:{}",this.getClass().getName(),fendianGoodsOrder.toString());
        fendianGoodsOrder.setInsertTime(new Date());
        fendianGoodsOrder.setCreateTime(new Date());
        fendianGoodsOrderService.insert(fendianGoodsOrder);
        return R.ok();
    }

    /**
     * 后端修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody FendianGoodsOrderEntity fendianGoodsOrder, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,fendianGoodsOrder:{}",this.getClass().getName(),fendianGoodsOrder.toString());
        fendianGoodsOrderService.updateById(fendianGoodsOrder);//根据id更新
        return R.ok();
    }


    /**
     * 购买
     */
    @RequestMapping("/outFendianGoodsOrderList")
    public R outFendianGoodsOrderList(@RequestBody  Map<String, Object> params,HttpServletRequest request){
        logger.debug("outFendianGoodsOrderList方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        Date date = new Date();//当前时间
        Integer userId = (Integer) request.getSession().getAttribute("userId");//当前登录人的id
        String tableName = (String) request.getSession().getAttribute("tableName");//当前登录人的表名
        YonghuEntity yonghuEntity = yonghuService.selectById(userId);//当前登录人的信息
        //当前表的表级联查询
        String huiyuanId = (String) params.get("huiyuanId"); //会员
        HuiyuanEntity huiyuanEntity = huiyuanService.selectById(huiyuanId);
        if(huiyuanEntity == null){
            return R.error("会员查询不到");
        }
        HashMap<String, Integer> map = (HashMap<String, Integer>) params.get("map");// id 和 数量
        if(map == null || map.size() ==0){
            return R.error("添加不能为空");
        }else{
            Double originalMoney=0.0;
            Set<String> ids = map.keySet(); // 获取添加数据的ids
            List<FendianGoodsEntity> fendianGoodsList = fendianGoodsService.selectList(new EntityWrapper<FendianGoodsEntity>().in("id", ids));
            if(fendianGoodsList == null  || fendianGoodsList.size() ==0 || map.size() != fendianGoodsList.size() ){
                return R.error("查询分店物资为空 或者 购买的物资和数据库中不一致,请去列表中查找确认");
            }else{
                for(FendianGoodsEntity fendianGoods : fendianGoodsList){
                    Integer i = fendianGoods.getFendianGoodsNumber() - map.get(String.valueOf(fendianGoods.getId()));
                    if(i<0){
                        return R.error(fendianGoods.getGoodsName()+"的购买数量超过了库存数量，请核实");
                    }
                    fendianGoods.setFendianGoodsNumber(fendianGoods.getFendianGoodsNumber()-map.get(String.valueOf(fendianGoods.getId())));
                    originalMoney+=fendianGoods.getDanjia()*map.get(String.valueOf(fendianGoods.getId()));//加上总价
                }
            }

            //添加当前列表
            FendianGoodsOrderEntity fendianGoodsOrderEntity = new FendianGoodsOrderEntity();//新增订单
            String role = String.valueOf(request.getSession().getAttribute("role"));
            if(StringUtil.isNotEmpty(role) && "管理员".equals(role)){
                fendianGoodsOrderEntity.setCaozuoName(String.valueOf(request.getSession().getAttribute("username")));
            }else{
                fendianGoodsOrderEntity.setCaozuoName(yonghuEntity.getYonghuName());
            }
            fendianGoodsOrderEntity.setCaozuoTable(tableName);
            fendianGoodsOrderEntity.setHuiyuanId(Integer.valueOf(huiyuanId));
            fendianGoodsOrderEntity.setOriginalMoney(originalMoney);
            //会员积分规则
            if(huiyuanEntity.getJifenTypes() ==1){//钻石会员 8折
                fendianGoodsOrderEntity.setDiscountMoney(originalMoney*0.8);
            }else if(huiyuanEntity.getJifenTypes() == 2){//黄金会员 85折
                fendianGoodsOrderEntity.setDiscountMoney(originalMoney*0.85);
            }else if(huiyuanEntity.getJifenTypes() == 3){//白银会员 9折
                fendianGoodsOrderEntity.setDiscountMoney(originalMoney*0.9);
            }else if(huiyuanEntity.getJifenTypes() == 4){//青铜会员 9.5折
                fendianGoodsOrderEntity.setDiscountMoney(originalMoney*0.95);
            }else{
                return R.error("会员等级不正确，请确认会员等级");
            }
            fendianGoodsOrderEntity.setInsertTime(date);
            fendianGoodsOrderEntity.setCreateTime(date);
            fendianGoodsOrderService.insert(fendianGoodsOrderEntity);

            //详情表的添加
            List<FendianGoodsOrderListEntity> fendianGoodsOrderLists = new ArrayList<>();
            for(String i:ids){
                FendianGoodsOrderListEntity entity = new FendianGoodsOrderListEntity();
                entity.setFendianGoodsOrderId(fendianGoodsOrderEntity.getId());
                entity.setFendianGoodsId(Integer.valueOf(i));
                entity.setFendianGoodsOrderListNumber(map.get(i));
                entity.setCreateTime(date);
                fendianGoodsOrderLists.add(entity);
            }
            fendianGoodsOrderListService.insertBatch(fendianGoodsOrderLists);//更新分店订单详情表
            fendianGoodsService.updateBatchById(fendianGoodsList);// 更新分店物资
            Double jifen = huiyuanEntity.getJifen() + originalMoney;
            huiyuanEntity.setJifen(jifen.intValue());//更新会员积分
            huiyuanService.updateById(huiyuanEntity);
            return R.ok();
        }
    }

//    /**
//     * 入入入入入入入入入入入入入入入
//     */
//    @RequestMapping("/inFendianGoodsOrderList")
//    public R inFendianGoodsOrderList(@RequestBody  Map<String, Object> params,HttpServletRequest request){
//        logger.debug("outFendianGoodsOrderList方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
//
//
//        Date date = new Date();//当前时间
//        Integer userId = (Integer) request.getSession().getAttribute("userId");//当前登录人的id
//        String tableName = (String) request.getSession().getAttribute("tableName");//当前登录人的表名
//        YonghuEntity yonghuEntity = yonghuService.selectById(userId);//当前登录人的信息
//        //当前表的表级联查询
//        String huiyuanId = (String) params.get("huiyuanId"); //会员
//        HashMap<String, Integer> map = (HashMap<String, Integer>) params.get("map");// id 和 数量
//        if(map == null || map.size() ==0){
//            return R.error("添加不能为空");
//        }else{
//            Set<String> ids = map.keySet(); // 获取添加数据的ids
//            List<FendianGoodsEntity> fendianGoodsList = fendianGoodsService.selectList(new EntityWrapper<FendianGoodsEntity>().in("id", ids));
//            if(fendianGoodsList == null  || fendianGoodsList.size() ==0 || map.size() != fendianGoodsList.size() ){
//                return R.error("查询物资为空 或者 采购的物资和数据库中不一致,请去列表中查找确认");
//            }else{
//                for(FendianGoodsEntity fendianGoods : fendianGoodsList){
//                    fendianGoods.setFendianGoodsNumber(fendianGoods.getFendianGoodsNumber()+map.get(String.valueOf(fendianGoods.getId())));
//                }
//            }
//
//            //添加当前列表
//            FendianGoodsOrderEntity fendianGoodsOrderEntity = new FendianGoodsOrderEntity();//新增订单
//            String role = String.valueOf(request.getSession().getAttribute("role"));
//            if(StringUtil.isNotEmpty(role) && "管理员".equals(role)){
//                fendianGoodsOrderEntity.setCaozuoName(String.valueOf(request.getSession().getAttribute("username")));
//            }else{
//                fendianGoodsOrderEntity.setCaozuoName(yonghuEntity.getYonghuName());
//            }
//            fendianGoodsOrderEntity.setCaozuoTable(tableName);
//            fendianGoodsOrderEntity.setHuiyuanId(Integer.valueOf(huiyuanId));
//            fendianGoodsOrderEntity.setOriginalMoney(0.0);
//            fendianGoodsOrderEntity.setDiscountMoney(0.0);
//            fendianGoodsOrderEntity.setInsertTime(date);
//            fendianGoodsOrderEntity.setCreateTime(date);
//            fendianGoodsOrderService.insert(fendianGoodsOrderEntity);
//
//            //详情表的添加
//            List<FendianGoodsOrderListEntity> fendianGoodsOrderLists = new ArrayList<>();
//            for(String i:ids){
//                FendianGoodsOrderListEntity entity = new FendianGoodsOrderListEntity();
//                entity.setFendianGoodsOrderId(fendianGoodsOrderEntity.getId());
//                entity.setFendianGoodsId(Integer.valueOf(i));
//                entity.setFendianGoodsOrderListNumber(map.get(i));
//                entity.setCreateTime(date);
//                fendianGoodsOrderLists.add(entity);
//            }
//            fendianGoodsOrderListService.insertBatch(fendianGoodsOrderLists);
//            fendianGoodsService.updateBatchById(fendianGoodsList);
//            return R.ok();
//        }
//    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        fendianGoodsOrderService.deleteBatchIds(Arrays.asList(ids));
        fendianGoodsOrderListService.delete(new EntityWrapper<FendianGoodsOrderListEntity>().in("fendian_goods_order_id",ids));
        return R.ok();
    }



}

