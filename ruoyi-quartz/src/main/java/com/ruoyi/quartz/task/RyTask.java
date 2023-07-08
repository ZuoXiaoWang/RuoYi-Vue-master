package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.service.IInspectionRouteService;
import com.ruoyi.system.service.ISysPatrolPointService;
import com.ruoyi.system.service.ISysPatrolService;
import com.ruoyi.system.service.ISysPersonnelService;
import com.ruoyi.system.service.impl.SysPatrolServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import com.ruoyi.common.utils.StringUtils;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 定时任务调度测试
 *
 * @author ruoyi
 */
@Component("ryTask")
public class RyTask {
    @Autowired
    private ISysPatrolService patrolService;

    @Autowired
    private ISysPersonnelService personnelService;

    @Autowired
    private ISysPatrolPointService patrolPointService;

    @Autowired
    private IInspectionRouteService inspectionRouteService;

    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params) {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams() {
        System.out.println("执行无参方法");
    }


    //生成任务工单
    public void creatPatrolTask(Long patrolId) {
//        根据patrolId查询模板任务
        SysPatrol template = patrolService.selectSysPatrolTemplateByPatrolId(patrolId);
        List<Long> personnelList = personnelService.selectPersonnelListByPatrolId(patrolId);
//        Long[] longs = inspectionRouteService.selectInspectionRoutePointRelIds(template.getInspectionRouteId());

        List<Long> patrolPointList = patrolPointService.selectPatrolPointListByPatrolId(patrolId);
        SysPatrol sysPatrol = new SysPatrol();
        //template.setPatrolId(null);
        BeanUtils.copyBeanProp(sysPatrol, template);
        sysPatrol.setPatrolId(null);
        sysPatrol.setType("0");

        //计算差值
        long diff = template.getPatrolEndTime().getTime() - template.getPatrolStartTime().getTime();
        sysPatrol.setPatrolStartTime(changeDate(template.getPatrolStartTime(),0));
        long time = sysPatrol.getPatrolStartTime().getTime();
        time = time + diff;
        Date date = new Date();
        date.setTime(time);
        sysPatrol.setPatrolEndTime(date);

//        //将yy-mm-dd换成当日日期
//        sysPatrol.setPatrolStartTime(changeDate(template.getPatrolStartTime(),0));
//        sysPatrol.setPatrolEndTime(changeDate(template.getPatrolEndTime(),0));



        patrolService.insertSysPatrol(sysPatrol, personnelList, patrolPointList);
        System.out.println("_________________________________________________\n" +
                "||||||||||||||||||||||||||||||||||||||||||||||||||");
    }

    public Date changeDate(Date templateDataTime, int addDate) {
        Date nowDate = DateUtils.getNowDate();
        Calendar calendar = Calendar.getInstance();
        templateDataTime.setDate(nowDate.getDate());
        templateDataTime.setMonth(nowDate.getMonth());
        templateDataTime.setYear(nowDate.getYear());
        calendar.setTime(templateDataTime);
        calendar.add(Calendar.DAY_OF_YEAR,addDate);
        return calendar.getTime();
    }
}
