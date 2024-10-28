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

import com.entity.GoodsOrderListEntity;

import com.service.GoodsOrderListService;
import com.entity.view.GoodsOrderListView;
import com.service.GoodsService;
import com.entity.GoodsEntity;
import com.service.GoodsOrderService;
import com.entity.GoodsOrderEntity;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 采购调度详情表
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/goodsOrderList")
public class GoodsOrderListController {
    private static final Logger logger = LoggerFactory.getLogger(GoodsOrderListController.class);

    @Autowired
    private GoodsOrderListService goodsOrderListService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;



    //级联表service
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsOrderService goodsOrderService;


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
        PageUtils page = goodsOrderListService.queryPage(params);

        //字典表数据转换
        List<GoodsOrderListView> list =(List<GoodsOrderListView>)page.getList();
        for(GoodsOrderListView c:list){
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
        GoodsOrderListEntity goodsOrderList = goodsOrderListService.selectById(id);
        if(goodsOrderList !=null){
            //entity转view
            GoodsOrderListView view = new GoodsOrderListView();
            BeanUtils.copyProperties( goodsOrderList , view );//把实体数据重构到view中

            //级联表
            GoodsEntity goods = goodsService.selectById(goodsOrderList.getGoodsId());
            if(goods != null){
                BeanUtils.copyProperties( goods , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setGoodsId(goods.getId());
            }
            //级联表
            GoodsOrderEntity goodsOrder = goodsOrderService.selectById(goodsOrderList.getGoodsOrderId());
            if(goodsOrder != null){
                BeanUtils.copyProperties( goodsOrder , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setGoodsOrderId(goodsOrder.getId());
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
    public R save(@RequestBody GoodsOrderListEntity goodsOrderList, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,goodsOrderList:{}",this.getClass().getName(),goodsOrderList.toString());
        goodsOrderList.setCreateTime(new Date());
        goodsOrderListService.insert(goodsOrderList);
        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody GoodsOrderListEntity goodsOrderList, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,goodsOrderList:{}",this.getClass().getName(),goodsOrderList.toString());
        goodsOrderListService.updateById(goodsOrderList);//根据id更新
        return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        goodsOrderListService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}

