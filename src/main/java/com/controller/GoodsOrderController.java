package com.controller;


import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;

import com.entity.*;
import com.service.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;

import com.utils.StringUtil;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import com.entity.view.GoodsOrderView;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 采购调度表
 * 后端接口
 * @author
 * @email
 * @date 2021-04-09
*/
@RestController
@Controller
@RequestMapping("/goodsOrder")
public class GoodsOrderController {
    private static final Logger logger = LoggerFactory.getLogger(GoodsOrderController.class);

    @Autowired
    private GoodsOrderService goodsOrderService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;



    //级联表service
    @Autowired
    private FendianService fendianService;
    @Autowired
    private GongyingshangService gongyingshangService;
    // 列表详情的表级联service
    @Autowired
    private GoodsOrderListService goodsOrderListService;
    @Autowired
    private YonghuService yonghuService;
    @Autowired
    private GoodsService goodsService;
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
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        }
        params.put("orderBy","id");
        PageUtils page = goodsOrderService.queryPage(params);

        //字典表数据转换
        List<GoodsOrderView> list =(List<GoodsOrderView>)page.getList();
        for(GoodsOrderView c:list){
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
        GoodsOrderEntity goodsOrder = goodsOrderService.selectById(id);
        if(goodsOrder !=null){
            //entity转view
            GoodsOrderView view = new GoodsOrderView();
            BeanUtils.copyProperties( goodsOrder , view );//把实体数据重构到view中

            //级联表
            FendianEntity fendian = fendianService.selectById(goodsOrder.getFendianId());
            if(fendian != null){
                BeanUtils.copyProperties( fendian , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setFendianId(fendian.getId());
            }
            //级联表
            GongyingshangEntity gongyingshang = gongyingshangService.selectById(goodsOrder.getGongyingshangId());
            if(gongyingshang != null){
                BeanUtils.copyProperties( gongyingshang , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setGongyingshangId(gongyingshang.getId());
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
    public R save(@RequestBody GoodsOrderEntity goodsOrder, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,goodsOrder:{}",this.getClass().getName(),goodsOrder.toString());
        goodsOrder.setInsertTime(new Date());
        goodsOrder.setCreateTime(new Date());
        goodsOrderService.insert(goodsOrder);
        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody GoodsOrderEntity goodsOrder, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,goodsOrder:{}",this.getClass().getName(),goodsOrder.toString());
        goodsOrderService.updateById(goodsOrder);//根据id更新
        return R.ok();
    }


    /**
    * 调度
    */
    @RequestMapping("/outGoodsOrderList")
    public R outGoodsOrderList(@RequestBody  Map<String, Object> params,HttpServletRequest request){
        logger.debug("outGoodsOrderList方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        Date date = new Date();//当前时间
        Integer userId = (Integer) request.getSession().getAttribute("userId");//当前登录人的id
        String tableName = (String) request.getSession().getAttribute("tableName");//当前登录人的表名
        YonghuEntity yonghuEntity = yonghuService.selectById(userId);//当前登录人的信息
        //当前表的表级联查询
//        String gongyingshangId = (String) params.get("gongyingshangId"); //供应商
        String fendianId = (String) params.get("fendianId"); //分店
        if(fendianId == "" || fendianId== null || fendianId == "null"){
            return R.error("请选择分店");
        }
        String goodsOrderName = (String) params.get("goodsOrderName"); // 订单名
        HashMap<String, Integer> map = (HashMap<String, Integer>) params.get("map");// id 和 数量
        if(map == null || map.size() ==0){
            return R.error("添加不能为空");
        }else{
            Set<String> ids = map.keySet(); // 获取添加数据的ids
            List<GoodsEntity> goodsList = goodsService.selectList(new EntityWrapper<GoodsEntity>().in("id", ids));
            if(goodsList == null  || goodsList.size() ==0 || map.size() != goodsList.size() ){
                return R.error("查询物资为空 或者 采购的物资和数据库中不一致,请去列表中查找确认");
            }else{
                for(GoodsEntity goods : goodsList){
                    if(goods.getGoodsNumber()-map.get(String.valueOf(goods.getId())) <0){
                        return R.error(goods.getGoodsName()+"的出库数量小于大于库存数量,请重新确认出库数量");
                    }
                    goods.setGoodsNumber(goods.getGoodsNumber()-map.get(String.valueOf(goods.getId())));
                }
            }


            // 查询当前分店的所有库存
            List<FendianGoodsEntity> fendianGoodsEntities = fendianGoodsService.selectList(new EntityWrapper<FendianGoodsEntity>().eq("fendian_id",fendianId));
            HashMap<Integer, FendianGoodsEntity> fendianGoodsMap = new HashMap<>();
            for(FendianGoodsEntity fendianGoods :fendianGoodsEntities){
                fendianGoodsMap.put(fendianGoods.getGoodsOnly(),fendianGoods);//以总店id作为key,以对象作为值,用于下面判断
            }

            List<FendianGoodsEntity> fendianGoodsEntityList = new ArrayList<>();//要更新的分店库存对象
            for(GoodsEntity goods:goodsList){
                FendianGoodsEntity fendianGoodsEntity = fendianGoodsMap.get(goods.getId());
                if(fendianGoodsEntity != null){//分店有这个对象
                    //新的数量
                    Integer newNumber = fendianGoodsEntity.getFendianGoodsNumber() + map.get(String.valueOf(goods.getId()));//当前库存数量加上调度数量
                    fendianGoodsEntity.setFendianGoodsNumber(newNumber);
                }else{//分店没有这个对象
                    FendianGoodsEntity newFendianGoodsEntity = new FendianGoodsEntity();
                    BeanUtils.copyProperties( goods , newFendianGoodsEntity ,new String[]{"id","createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    newFendianGoodsEntity.setFendianId(Integer.valueOf(fendianId));//分店id
                    newFendianGoodsEntity.setGoodsOnly(goods.getId());//总库的id用于判断
                    newFendianGoodsEntity.setCreateTime(date);//创建时间
                    newFendianGoodsEntity.setFendianGoodsNumber(map.get(String.valueOf(goods.getId())));//数量
                    fendianGoodsEntityList.add(newFendianGoodsEntity);
                }
            }

            //把修改对象放进对象中
            Set<Integer> integers = fendianGoodsMap.keySet();
            for(Integer i:integers){
                fendianGoodsEntityList.add(fendianGoodsMap.get(i));
            }


            //添加到订单列表
            GoodsOrderEntity goodsOrderEntity = new GoodsOrderEntity();//新增订单
            goodsOrderEntity.setGoodsOrderName(goodsOrderName);
            String role = String.valueOf(request.getSession().getAttribute("role"));
            if(StringUtil.isNotEmpty(role) && "管理员".equals(role)){
                goodsOrderEntity.setCaozuoName(String.valueOf(request.getSession().getAttribute("username")));
            }else{
                goodsOrderEntity.setCaozuoName(yonghuEntity.getYonghuName());
            }
            goodsOrderEntity.setCaozuoTable(tableName);
            goodsOrderEntity.setGoodsOrderTypes(2);
            goodsOrderEntity.setGongyingshangId(null);
            goodsOrderEntity.setFendianId(Integer.valueOf(fendianId));
            goodsOrderEntity.setInsertTime(date);
            goodsOrderEntity.setCreateTime(date);
            goodsOrderService.insert(goodsOrderEntity);//新增订单

            //详情表的添加
            List<GoodsOrderListEntity> goodsOrderLists = new ArrayList<>();
            for(String i:ids){
                GoodsOrderListEntity entity = new GoodsOrderListEntity();
                entity.setGoodsOrderId(goodsOrderEntity.getId());
                entity.setGoodsId(Integer.valueOf(i));
                entity.setGoodsOrderListNumber(map.get(i));
                entity.setCreateTime(date);
                goodsOrderLists.add(entity);
            }
            goodsOrderListService.insertBatch(goodsOrderLists);//新增订单详情表
            goodsService.updateBatchById(goodsList);//更新总库
            fendianGoodsService.insertOrUpdateBatch(fendianGoodsEntityList);//添加和修改分店库存
            return R.ok();
        }
    }

    /**
    * 采购
    */
    @RequestMapping("/inGoodsOrderList")
    public R inGoodsOrderList(@RequestBody  Map<String, Object> params,HttpServletRequest request){
        logger.debug("outGoodsOrderList方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));


        Date date = new Date();//当前时间
        Integer userId = (Integer) request.getSession().getAttribute("userId");//当前登录人的id
        String tableName = (String) request.getSession().getAttribute("tableName");//当前登录人的表名
        YonghuEntity yonghuEntity = yonghuService.selectById(userId);//当前登录人的信息
            //当前表的表级联查询
        String gongyingshangId = (String) params.get("gongyingshangId"); //供应商
        if(gongyingshangId == "" || gongyingshangId== null || gongyingshangId == "null"){
            return R.error("请选择供应商");
        }
//        String fendianId = (String) params.get("fendianId"); //分店
        String goodsOrderName = (String) params.get("goodsOrderName"); // 订单名
        HashMap<String, Integer> map = (HashMap<String, Integer>) params.get("map");// id 和 数量
        if(map == null || map.size() ==0){
            return R.error("添加不能为空");
        }else{
            Set<String> ids = map.keySet(); // 获取添加数据的ids
            //查询总库库存 并进行修改
            List<GoodsEntity> goodsList = goodsService.selectList(new EntityWrapper<GoodsEntity>().in("id", ids));
            if(goodsList == null  || goodsList.size() ==0 || map.size() != goodsList.size() ){
                return R.error("查询物资为空 或者 采购的物资和数据库中不一致,请去列表中查找确认");
            }else {
                for (GoodsEntity goods : goodsList) {
                    goods.setGoodsNumber(goods.getGoodsNumber() + map.get(String.valueOf(goods.getId())));
                }
            }

            //添加当前列表
            GoodsOrderEntity goodsOrderEntity = new GoodsOrderEntity();//新增订单
            goodsOrderEntity.setGoodsOrderName(goodsOrderName);
            String role = String.valueOf(request.getSession().getAttribute("role"));
            if(StringUtil.isNotEmpty(role) && "管理员".equals(role)){
                goodsOrderEntity.setCaozuoName(String.valueOf(request.getSession().getAttribute("username")));
            }else{
                goodsOrderEntity.setCaozuoName(yonghuEntity.getYonghuName());
            }
            goodsOrderEntity.setCaozuoTable(tableName);
            goodsOrderEntity.setGoodsOrderTypes(1);
            goodsOrderEntity.setGongyingshangId(Integer.valueOf(gongyingshangId));
//            goodsOrderEntity.setFendianId(Integer.valueOf(fendianId));
            goodsOrderEntity.setFendianId(null);
            goodsOrderEntity.setInsertTime(date);
            goodsOrderEntity.setCreateTime(date);
            goodsOrderService.insert(goodsOrderEntity);

                //详情表的添加
            List<GoodsOrderListEntity> goodsOrderLists = new ArrayList<>();
            for(String i:ids){
                GoodsOrderListEntity entity = new GoodsOrderListEntity();
                entity.setGoodsOrderId(goodsOrderEntity.getId());
                entity.setGoodsId(Integer.valueOf(i));
                entity.setGoodsOrderListNumber(map.get(i));
                entity.setCreateTime(date);
                goodsOrderLists.add(entity);
            }
            goodsOrderListService.insertBatch(goodsOrderLists);
            goodsService.updateBatchById(goodsList);
            return R.ok();
        }
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        goodsOrderService.deleteBatchIds(Arrays.asList(ids));
        goodsOrderListService.delete(new EntityWrapper<GoodsOrderListEntity>().in("goods_order_id",ids));
        return R.ok();
    }



}

