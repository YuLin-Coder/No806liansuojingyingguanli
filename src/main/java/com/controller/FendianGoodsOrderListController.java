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

import com.entity.FendianGoodsOrderListEntity;

import com.service.FendianGoodsOrderListService;
import com.entity.view.FendianGoodsOrderListView;
import com.service.FendianGoodsService;
import com.entity.FendianGoodsEntity;
import com.service.FendianGoodsOrderService;
import com.entity.FendianGoodsOrderEntity;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 购买订单详情
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/fendianGoodsOrderList")
public class FendianGoodsOrderListController {
    private static final Logger logger = LoggerFactory.getLogger(FendianGoodsOrderListController.class);

    @Autowired
    private FendianGoodsOrderListService fendianGoodsOrderListService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;



    //级联表service
    @Autowired
    private FendianGoodsService fendianGoodsService;
    @Autowired
    private FendianGoodsOrderService fendianGoodsOrderService;


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
        PageUtils page = fendianGoodsOrderListService.queryPage(params);

        //字典表数据转换
        List<FendianGoodsOrderListView> list =(List<FendianGoodsOrderListView>)page.getList();
        for(FendianGoodsOrderListView c:list){
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
        FendianGoodsOrderListEntity fendianGoodsOrderList = fendianGoodsOrderListService.selectById(id);
        if(fendianGoodsOrderList !=null){
            //entity转view
            FendianGoodsOrderListView view = new FendianGoodsOrderListView();
            BeanUtils.copyProperties( fendianGoodsOrderList , view );//把实体数据重构到view中

            //级联表
            FendianGoodsEntity fendianGoods = fendianGoodsService.selectById(fendianGoodsOrderList.getFendianGoodsId());
            if(fendianGoods != null){
                BeanUtils.copyProperties( fendianGoods , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setFendianGoodsId(fendianGoods.getId());
            }
            //级联表
            FendianGoodsOrderEntity fendianGoodsOrder = fendianGoodsOrderService.selectById(fendianGoodsOrderList.getFendianGoodsOrderId());
            if(fendianGoodsOrder != null){
                BeanUtils.copyProperties( fendianGoodsOrder , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setFendianGoodsOrderId(fendianGoodsOrder.getId());
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
    public R save(@RequestBody FendianGoodsOrderListEntity fendianGoodsOrderList, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,fendianGoodsOrderList:{}",this.getClass().getName(),fendianGoodsOrderList.toString());
        fendianGoodsOrderList.setCreateTime(new Date());
        fendianGoodsOrderListService.insert(fendianGoodsOrderList);
        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody FendianGoodsOrderListEntity fendianGoodsOrderList, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,fendianGoodsOrderList:{}",this.getClass().getName(),fendianGoodsOrderList.toString());
        fendianGoodsOrderListService.updateById(fendianGoodsOrderList);//根据id更新
        return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        fendianGoodsOrderListService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}

