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

import com.entity.FendianEntity;

import com.service.FendianService;
import com.entity.view.FendianView;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 连锁店
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/fendian")
public class FendianController {
    private static final Logger logger = LoggerFactory.getLogger(FendianController.class);

    @Autowired
    private FendianService fendianService;


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
        params.put("orderBy","id");
        PageUtils page = fendianService.queryPage(params);

        //字典表数据转换
        List<FendianView> list =(List<FendianView>)page.getList();
        for(FendianView c:list){
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
        FendianEntity fendian = fendianService.selectById(id);
        if(fendian !=null){
            //entity转view
            FendianView view = new FendianView();
            BeanUtils.copyProperties( fendian , view );//把实体数据重构到view中

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
    public R save(@RequestBody FendianEntity fendian, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,fendian:{}",this.getClass().getName(),fendian.toString());
        Wrapper<FendianEntity> queryWrapper = new EntityWrapper<FendianEntity>()
            .eq("fendian_name", fendian.getFendianName())
            .eq("fendian_types", fendian.getFendianTypes())
            .eq("fendian_address", fendian.getFendianAddress())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FendianEntity fendianEntity = fendianService.selectOne(queryWrapper);
        if(fendianEntity==null){
            fendian.setCreateTime(new Date());
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      fendian.set
        //  }
            fendianService.insert(fendian);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody FendianEntity fendian, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,fendian:{}",this.getClass().getName(),fendian.toString());
        //根据字段查询是否有相同数据
        Wrapper<FendianEntity> queryWrapper = new EntityWrapper<FendianEntity>()
            .notIn("id",fendian.getId())
            .andNew()
            .eq("fendian_name", fendian.getFendianName())
            .eq("fendian_types", fendian.getFendianTypes())
            .eq("fendian_address", fendian.getFendianAddress())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FendianEntity fendianEntity = fendianService.selectOne(queryWrapper);
        if(fendianEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      fendian.set
            //  }
            fendianService.updateById(fendian);//根据id更新
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
        fendianService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}

