package com.controller;


import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;

import com.entity.YonghuEntity;
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

import com.entity.FendianGoodsEntity;

import com.entity.view.FendianGoodsView;
import com.entity.FendianEntity;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 分店物资
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/fendianGoods")
public class FendianGoodsController {
    private static final Logger logger = LoggerFactory.getLogger(FendianGoodsController.class);

    @Autowired
    private FendianGoodsService fendianGoodsService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;



    //级联表service
    @Autowired
    private FendianService fendianService;
    @Autowired
    private YonghuService yonghuService;


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
        PageUtils page = fendianGoodsService.queryPage(params);

        //字典表数据转换
        List<FendianGoodsView> list =(List<FendianGoodsView>)page.getList();
        for(FendianGoodsView c:list){
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
        FendianGoodsEntity fendianGoods = fendianGoodsService.selectById(id);
        if(fendianGoods !=null){
            //entity转view
            FendianGoodsView view = new FendianGoodsView();
            BeanUtils.copyProperties( fendianGoods , view );//把实体数据重构到view中

            //级联表
            FendianEntity fendian = fendianService.selectById(fendianGoods.getFendianId());
            if(fendian != null){
                BeanUtils.copyProperties( fendian , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                view.setFendianId(fendian.getId());
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
    public R save(@RequestBody FendianGoodsEntity fendianGoods, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,fendianGoods:{}",this.getClass().getName(),fendianGoods.toString());
        Wrapper<FendianGoodsEntity> queryWrapper = new EntityWrapper<FendianGoodsEntity>()
            .eq("fendian_id", fendianGoods.getFendianId())
            .eq("goods_only", fendianGoods.getGoodsOnly())
            .eq("goods_name", fendianGoods.getGoodsName())
            .eq("goods_types", fendianGoods.getGoodsTypes())
            .eq("fendian_goods_number", fendianGoods.getFendianGoodsNumber())
            .eq("danwei", fendianGoods.getDanwei())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FendianGoodsEntity fendianGoodsEntity = fendianGoodsService.selectOne(queryWrapper);
        if(fendianGoodsEntity==null){
            fendianGoods.setCreateTime(new Date());
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      fendianGoods.set
        //  }
            fendianGoodsService.insert(fendianGoods);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody FendianGoodsEntity fendianGoods, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,fendianGoods:{}",this.getClass().getName(),fendianGoods.toString());
        //根据字段查询是否有相同数据
        Wrapper<FendianGoodsEntity> queryWrapper = new EntityWrapper<FendianGoodsEntity>()
            .notIn("id",fendianGoods.getId())
            .andNew()
            .eq("fendian_id", fendianGoods.getFendianId())
            .eq("goods_only", fendianGoods.getGoodsOnly())
            .eq("goods_name", fendianGoods.getGoodsName())
            .eq("goods_types", fendianGoods.getGoodsTypes())
            .eq("fendian_goods_number", fendianGoods.getFendianGoodsNumber())
            .eq("danwei", fendianGoods.getDanwei())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FendianGoodsEntity fendianGoodsEntity = fendianGoodsService.selectOne(queryWrapper);
        if("".equals(fendianGoods.getGoodsPhoto()) || "null".equals(fendianGoods.getGoodsPhoto())){
                fendianGoods.setGoodsPhoto(null);
        }
        if(fendianGoodsEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      fendianGoods.set
            //  }
            fendianGoodsService.updateById(fendianGoods);//根据id更新
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
        fendianGoodsService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}

