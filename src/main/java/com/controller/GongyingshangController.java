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

import com.entity.GongyingshangEntity;

import com.service.GongyingshangService;
import com.entity.view.GongyingshangView;

import com.utils.PageUtils;
import com.utils.R;

/**
 * 供应商
 * 后端接口
 * @author
 * @email
 * @date 2021-04-10
*/
@RestController
@Controller
@RequestMapping("/gongyingshang")
public class GongyingshangController {
    private static final Logger logger = LoggerFactory.getLogger(GongyingshangController.class);

    @Autowired
    private GongyingshangService gongyingshangService;


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
        PageUtils page = gongyingshangService.queryPage(params);

        //字典表数据转换
        List<GongyingshangView> list =(List<GongyingshangView>)page.getList();
        for(GongyingshangView c:list){
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
        GongyingshangEntity gongyingshang = gongyingshangService.selectById(id);
        if(gongyingshang !=null){
            //entity转view
            GongyingshangView view = new GongyingshangView();
            BeanUtils.copyProperties( gongyingshang , view );//把实体数据重构到view中

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
    public R save(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,gongyingshang:{}",this.getClass().getName(),gongyingshang.toString());
        Wrapper<GongyingshangEntity> queryWrapper = new EntityWrapper<GongyingshangEntity>()
            .eq("gongyingshang_name", gongyingshang.getGongyingshangName())
            .eq("gongyingshang_types", gongyingshang.getGongyingshangTypes())
            .eq("gongyingshang_xinyong_types", gongyingshang.getGongyingshangXinyongTypes())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        GongyingshangEntity gongyingshangEntity = gongyingshangService.selectOne(queryWrapper);
        if(gongyingshangEntity==null){
            gongyingshang.setCreateTime(new Date());
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      gongyingshang.set
        //  }
            gongyingshangService.insert(gongyingshang);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,gongyingshang:{}",this.getClass().getName(),gongyingshang.toString());
        //根据字段查询是否有相同数据
        Wrapper<GongyingshangEntity> queryWrapper = new EntityWrapper<GongyingshangEntity>()
            .notIn("id",gongyingshang.getId())
            .andNew()
            .eq("gongyingshang_name", gongyingshang.getGongyingshangName())
            .eq("gongyingshang_types", gongyingshang.getGongyingshangTypes())
            .eq("gongyingshang_xinyong_types", gongyingshang.getGongyingshangXinyongTypes())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        GongyingshangEntity gongyingshangEntity = gongyingshangService.selectOne(queryWrapper);
        if(gongyingshangEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      gongyingshang.set
            //  }
            gongyingshangService.updateById(gongyingshang);//根据id更新
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
        gongyingshangService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }



}

