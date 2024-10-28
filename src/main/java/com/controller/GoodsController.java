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

import com.entity.GoodsEntity;

import com.service.GoodsService;
import com.entity.view.GoodsView;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 总库物资
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/goods")
public class GoodsController {
    private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

    @Autowired
    private GoodsService goodsService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;



    //级联表service


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
        params.put("orderBy","id");params.put("flagStart",1);params.put("flagEnd",1);
        PageUtils page = goodsService.queryPage(params);

        //字典表数据转换
        List<GoodsView> list =(List<GoodsView>)page.getList();
        for(GoodsView c:list){
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
        GoodsEntity goods = goodsService.selectById(id);
        if(goods !=null){
            //entity转view
            GoodsView view = new GoodsView();
            BeanUtils.copyProperties( goods , view );//把实体数据重构到view中

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
    public R save(@RequestBody GoodsEntity goods, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,goods:{}",this.getClass().getName(),goods.toString());
        Wrapper<GoodsEntity> queryWrapper = new EntityWrapper<GoodsEntity>()
            .eq("goods_name", goods.getGoodsName())
            .eq("goods_types", goods.getGoodsTypes())
            .eq("goods_number", goods.getGoodsNumber())
            .eq("danwei", goods.getDanwei())
            .eq("flag", goods.getFlag())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        GoodsEntity goodsEntity = goodsService.selectOne(queryWrapper);
        if(goodsEntity==null){
            goods.setFlag(1);
            goods.setCreateTime(new Date());
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      goods.set
        //  }
            goodsService.insert(goods);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody GoodsEntity goods, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,goods:{}",this.getClass().getName(),goods.toString());
        //根据字段查询是否有相同数据
        Wrapper<GoodsEntity> queryWrapper = new EntityWrapper<GoodsEntity>()
            .notIn("id",goods.getId())
            .andNew()
            .eq("goods_name", goods.getGoodsName())
            .eq("goods_types", goods.getGoodsTypes())
            .eq("goods_number", goods.getGoodsNumber())
            .eq("danwei", goods.getDanwei())
            .eq("flag", goods.getFlag())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        GoodsEntity goodsEntity = goodsService.selectOne(queryWrapper);
        if("".equals(goods.getGoodsPhoto()) || "null".equals(goods.getGoodsPhoto())){
                goods.setGoodsPhoto(null);
        }
        if(goodsEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      goods.set
            //  }
            goodsService.updateById(goods);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
//        goodsService.deleteBatchIds(Arrays.asList(ids));
        List<GoodsEntity> list = new ArrayList<>();
        for(Integer i:ids){
            GoodsEntity goodsEntity = new GoodsEntity();
            goodsEntity.setFlag(2);
            goodsEntity.setId(i);
            list.add(goodsEntity);
        }
        goodsService.updateBatchById(list);
        return R.ok();
    }



}

