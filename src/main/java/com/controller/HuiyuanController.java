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

import com.entity.HuiyuanEntity;

import com.service.HuiyuanService;
import com.entity.view.HuiyuanView;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 会员
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/huiyuan")
public class HuiyuanController {
    private static final Logger logger = LoggerFactory.getLogger(HuiyuanController.class);

    @Autowired
    private HuiyuanService huiyuanService;


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
        PageUtils page = huiyuanService.queryPage(params);

        //字典表数据转换
        List<HuiyuanView> list =(List<HuiyuanView>)page.getList();
        for(HuiyuanView c:list){
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
        HuiyuanEntity huiyuan = huiyuanService.selectById(id);
        if(huiyuan !=null){
            //entity转view
            HuiyuanView view = new HuiyuanView();
            BeanUtils.copyProperties( huiyuan , view );//把实体数据重构到view中

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
    public R save(@RequestBody HuiyuanEntity huiyuan, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,huiyuan:{}",this.getClass().getName(),huiyuan.toString());
        Wrapper<HuiyuanEntity> queryWrapper = new EntityWrapper<HuiyuanEntity>()
            .eq("huiyuan_name", huiyuan.getHuiyuanName())
            .eq("sex_types", huiyuan.getSexTypes())
            .eq("huiyuan_id_number", huiyuan.getHuiyuanIdNumber())
            .eq("huiyuan_phone", huiyuan.getHuiyuanPhone())
            .eq("jifen", huiyuan.getJifen())
            .eq("jifen_types", huiyuan.getJifenTypes())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        HuiyuanEntity huiyuanEntity = huiyuanService.selectOne(queryWrapper);
        if(huiyuanEntity==null){
            huiyuan.setCreateTime(new Date());
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      huiyuan.set
        //  }
            huiyuanService.insert(huiyuan);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody HuiyuanEntity huiyuan, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,huiyuan:{}",this.getClass().getName(),huiyuan.toString());
        //根据字段查询是否有相同数据
        Wrapper<HuiyuanEntity> queryWrapper = new EntityWrapper<HuiyuanEntity>()
            .notIn("id",huiyuan.getId())
            .andNew()
            .eq("huiyuan_name", huiyuan.getHuiyuanName())
            .eq("sex_types", huiyuan.getSexTypes())
            .eq("huiyuan_id_number", huiyuan.getHuiyuanIdNumber())
            .eq("huiyuan_phone", huiyuan.getHuiyuanPhone())
            .eq("jifen", huiyuan.getJifen())
            .eq("jifen_types", huiyuan.getJifenTypes())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        HuiyuanEntity huiyuanEntity = huiyuanService.selectOne(queryWrapper);
        if(huiyuanEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      huiyuan.set
            //  }
            huiyuanService.updateById(huiyuan);//根据id更新
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
        huiyuanService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}

