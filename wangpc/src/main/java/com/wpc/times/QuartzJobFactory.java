/**
 * 文件名：QuartzJobFactory.java
 *
 * 描述：此处填写文件的描述信息
 * 
 * 日期：2016年4月29日
 * 
 * 本系统是商用软件，未经授权擅自复制或传播本程序的部分或全部将是非法的
 *
 * Copyright(C) WEAVER Corporation 2016 
 *
 */
package com.wpc.times;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.socket.TextMessage;

import com.wpc.websocket.MyWebSocketHander;

/**
 * <dl>
 * Class Description
 * <dd>项目名称：springmvc
 * <dd>类名称：QuartzJobFactory
 * <dd>类描述：概述类的作用
 * <dd>创建人：王鹏程
 * <dd>创建时间：2016年4月29日 下午4:16:27
 * <dd>修改人：无
 * <dd>修改时间：无
 * <dd>修改备注：无
 * </dl>
 * 
 * @author weaver
 * @see
 * @version 1.0
 * 
 */
@DisallowConcurrentExecution
public class QuartzJobFactory implements Job {

	/**
	 * <b>Overriding Method execute</b>
	 * <dd>方法作用：(这里用一句话描述这个方法的作用)
	 * 
	 * @param context
	 * @throws JobExecutionException
	 * @see org.quartz.Job#execute(org.quartz.JobExecutionContext)
	 * @since Met 1.0
	 */
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		System.out.println("任务运行开始...");
		ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		// TestRun tr = new TestRun();
		// tr.setName(scheduleJob.getJobName());
		// tr.say();

		MyWebSocketHander.sendMessageToUsers(new TextMessage("你好你好"));

		System.out.println("任务结束！！！");
	}

}
