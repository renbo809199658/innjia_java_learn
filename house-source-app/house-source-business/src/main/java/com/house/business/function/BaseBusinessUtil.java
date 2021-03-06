package com.house.business.function;

import java.io.StringWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.apache.commons.lang.StringUtils;
import org.iframework.commons.utils.md5.Md5Utils;
import org.iframework.commons.utils.validator.ValidatorUtils;
import org.iframework.support.domain.enums.RecordStatus;
import org.iframework.support.spring.context.BaseSpringContextSupport;
import org.iframework.support.spring.function.BaseCommonUtil;

import com.house.business.service.DateNumberService;

/**
 * 基本框架业务工具方法
 * 
 * @author shenpeng
 * 
 */
public class BaseBusinessUtil extends BaseCommonUtil {

	// ==============================================================支持DWZ框架的基础工具方法函数======================BEGIN===================================================
	/**
	 * 解码特殊字符(ascii)
	 * 
	 * @param str
	 *            解码前字符串
	 * 
	 * @return 解码后的字符串
	 */
	public static String unEscape(String str) {
		try {
			// 判断字符串是否为空,为空时直接返回原数据
			if (ValidatorUtils.isEmpty(str)) {
				return str;
			}
			// 获取&的下标位置
			int firstAmp = str.indexOf('&');
			if (firstAmp < 0)
				return str;
			// 字符串转为 StringWriter
			StringWriter stringWriter = new StringWriter(
					(int) ((double) str.length() + (double) str.length() * 0.10000000000000001D));
			// 保存下标0 - firstAmp位置的字符串
			stringWriter.write(str, 0, firstAmp);
			// 获取字符串字符长度
			int len = str.length();
			// 从firstAmp 开始循环字符串
			for (int i = firstAmp; i < len; i++) {
				// 获取单个字符
				char c = str.charAt(i);
				// 判断单个字符是否是&,为 true 时，进行转码操作
				if (c == '&') {
					// 设置查找分号的开始位置：&下标位置+1
					int nextIdx = i + 1;
					// 查找分号是否存在
					int semiColonIdx = str.indexOf(';', nextIdx);
					// 分号不存在时直接输出字符
					if (semiColonIdx == -1) {
						stringWriter.write(c);
						continue;
					}
					// 判断字符串中是否存在&
					int amphersandIdx = str.indexOf('&', i + 1);
					if (amphersandIdx != -1 && amphersandIdx < semiColonIdx) {
						stringWriter.write(c);
						continue;
					}
					// 截取字符串： 从&开始到分号结束
					String entityContent = str.substring(nextIdx, semiColonIdx);
					int entityValue = -1;
					// 截取到的字符串的长度
					int entityContentLen = entityContent.length();
					// 判断字符串长度是否大于0
					if (entityContentLen > 0) {
						// 删除字符串中空格
						entityContent = entityContent.replaceAll(" ", "");
						// 判断字符串是否以‘#’开始
						if (entityContent.charAt(0) == '#') {
							if (entityContentLen > 1) {
								char isHexChar = entityContent.charAt(1);
								try {
									switch (isHexChar) {
									case 88: // 'X'
									case 120: // 'x'
										entityValue = Integer.parseInt(entityContent.substring(2), 16);
										break;
									default:
										// 获取10进制数字
										entityValue = Integer.parseInt(entityContent.substring(1), 10);
										break;
									}
									if (entityValue > 65535)
										entityValue = -1;
								} catch (NumberFormatException e) {
									entityValue = -1;
								}
							}
						}
					}
					// entityValue = -1 时，表示字符未做改变,直接输出
					if (entityValue == -1) {
						stringWriter.write(38);
						stringWriter.write(entityContent);
						stringWriter.write(59);
					} else {
						// 输出解码后的char
						stringWriter.write(entityValue);
					}
					i = semiColonIdx;
				} else {
					// 判断单个字符是否是&,为 false 时，直接输出&
					stringWriter.write(c);
				}
			}
			// 返回string类型数据
			return stringWriter.toString();
		} catch (Exception e) {
			return str;
		}
	}

	/**
	 * 两个Double数相乘
	 * 
	 * @param param1
	 * @param param2
	 * 
	 * @return Double 乘积结果
	 */
	public static Double calculateByMultiplyAndDoube(Double param1, Double param2) {
		BigDecimal dec1 = new BigDecimal(Double.toString(param1));
		BigDecimal dec2 = new BigDecimal(Double.toString(param2));
		dec1 = dec1.multiply(dec2);
		return dec1.setScale(2).doubleValue();
	}

	/**
	 * 两个Double数相加
	 * 
	 * @param param1
	 * @param param2
	 * 
	 * @return Double 相加结果
	 */
	public static Double calculateByAddAndDoube(Double param1, Double param2) {
		BigDecimal dec1 = new BigDecimal(Double.toString(param1));
		BigDecimal dec2 = new BigDecimal(Double.toString(param2));
		dec1 = dec1.add(dec2);
		return dec1.setScale(2).doubleValue();
	}
	public static String eMessage(Throwable e)
	{
		String ret=e.toString();
		if(ValidatorUtils.isEmpty(e.getMessage()))return ret;
		return e.getMessage();
//			return ret+":"+e.getMessage();
	}
	/**
	 * 两个Double数相减
	 * 
	 * @param param1
	 *            被减数
	 * @param param2
	 *            减数
	 * 
	 * @return Double 相减结果
	 */
	public static Double calculateBySubtractAndDoube(Double param1, Double param2) {
		BigDecimal dec1 = new BigDecimal(Double.toString(param1));
		BigDecimal dec2 = new BigDecimal(Double.toString(param2));
		dec1 = dec1.subtract(dec2);
		return dec1.setScale(2).doubleValue();
	}

	/**
	 * double类型数据保留二位小数点 ，转为String
	 * 
	 * @param paramDouble
	 *            double类型数据
	 * 
	 * @return String 转换后的结果
	 */
	public static String formatDouble(double paramDouble) {
		DecimalFormat df = new DecimalFormat("#0.00");
		return df.format(paramDouble);
	}

	public static String getIdNumber() {
		  String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
		    Random random = new Random();   
		    StringBuffer sb = new StringBuffer();   
		    for (int i = 0; i < 7; i++) {   
		        int number = random.nextInt(base.length());   
		        sb.append(base.charAt(number));   
		    }   
		    return  new Date().getTime()+sb.toString();
	}


	/**
	 * 【角色业务】通过整型参数返回角色等级中文字符串<br/>
	 * 例如：${common.getRoleLevelStrName(vo.level)}<br/>
	 * 
	 * @param level
	 *            角色等级
	 * @return String 返回等级对应的字符串
	 */
	public static String getRoleLevelStrName(Integer level) {
		String strName = "";
		switch (level) {
		case 0:
			strName = "父级角色";
			break;
		case 1:
			strName = "&nbsp;&nbsp;子角色";
			break;
		case 2:
			strName = "&nbsp;&nbsp;&nbsp;&nbsp;子角色";
			break;
		default:
			strName = "<font color='red'>角色等级参数非法！</font>";
		}
		return strName;
	}


	/**
	 * 【菜单业务】通过整型参数返回菜单等级中文字符串<br/>
	 * 例如：${common.getMemuLevelStrName(vo.level)}<br/>
	 * 
	 * @param level
	 *            菜单等级
	 * @return String 返回等级对应的字符串
	 */
	public static String getMemuLevelStrName(Integer level) {
		String strName = "";
		switch (level) {
		case 0:
			strName = "父级菜单";
			break;
		case 1:
			strName = "&nbsp;&nbsp;子菜单";
			break;
		case 2:
			strName = "&nbsp;&nbsp;&nbsp;&nbsp;子菜单";
			break;
		default:
			strName = "<font color='red'>菜单等级参数非法！</font>";
		}
		return strName;
	}







	/**
	 * 【记录状态】根据不通的记录状态进行相应的操作<br/>
	 * 例如：${common.getRecordStatusOperate(vo.status,vo.id,basePath,navTabId,
	 * 'dialogAjaxEdit')}<br/>
	 * 
	 * @param recordStatus
	 *            记录状态 (必须)
	 * @param id
	 *            记录ID (必须)
	 * @param basePath
	 *            基本请求路径 (必须)
	 * @param navTabId
	 *            回调刷新的导航ID (必须)
	 * @param callback
	 *            回调的类型 (必须)
	 * @return String 返回已经加上操作的状态信息
	 */
	public static String getRecordStatusOperate(String recordStatus, String id, String basePath, String navTabId,
			String callback) {
		if (recordStatus.equals(RecordStatus.AVAILABLE.toString())) {
			return "<a href='" + basePath + "/admin/" + navTabId + "/updateStatus.do?id=" + id + "&status="
					+ RecordStatus.FORBID + "' target='ajaxTodo' callback='" + callback + "'>"
					+ RecordStatus.FORBID.getDesc() + "</a>";
		}

		if (recordStatus.equals(RecordStatus.FORBID.toString())) {
			return "<a href='" + basePath + "/admin/" + navTabId + "/updateStatus.do?id=" + id + "&status="
					+ RecordStatus.AVAILABLE + "' target='ajaxTodo' callback='" + callback + "'>"
					+ RecordStatus.AVAILABLE.getDesc() + "</a>";
		}

		if (recordStatus.equals(RecordStatus.DELETE.toString())) {
			return "<a href='" + basePath + "/admin/" + navTabId + "/updateStatus.do?id=" + id + "&status="
					+ RecordStatus.AVAILABLE + "' target='ajaxTodo' callback='" + callback + "'>撤销</a>";
		}

		return "";
	}

	/**
	 * 【记录状态】通过记录状态显示不通的提示颜色<br/>
	 * 例如：${common.getRecordStatus(vo.status)}<br/>
	 * 
	 * @param recordStatus
	 *            记录状态
	 * @return String 返回已经加上颜色的状态信息
	 */
	public static String getRecordStatus(String recordStatus) {
		if (recordStatus.equals(RecordStatus.AVAILABLE.toString())) {
			recordStatus = "<span style='color:green;line-height:21px;'>" + RecordStatus.AVAILABLE.getDesc()
					+ "</span>";
			return recordStatus;
		}

		if (recordStatus.equals(RecordStatus.DELETE.toString())) {
			recordStatus = "<span style='color:red;line-height:21px;'>" + RecordStatus.DELETE.getDesc() + "</span>";
			return recordStatus;
		}

		if (recordStatus.equals(RecordStatus.FORBID.toString())) {
			recordStatus = "<span style='color:gray;line-height:21px;'>" + RecordStatus.FORBID.getDesc() + "</span>";
			return recordStatus;
		}

		return "";
	}

	/**
	 * 【地址处理】根据现有连接判断是否已经带参数，如果已经带参数则导航参数&方式添加如果没有参数则?方式添加
	 * 
	 * @param url
	 *            请求的地址
	 * @param nav
	 *            导航参数
	 * @return String 返回解析拼接后的URL地址链接
	 */
	public static String getResolveNavTabIdUrl(String url, String nav) {
		return url.indexOf("?") > 0 ? url + "&navTabId=" + nav : url + "?navTabId=" + nav;
	}

	/**
	 * 【地址处理】根据现有连接判断是否已经带参数，如果已经带参数则导航参数&方式添加如果没有参数则?方式添加
	 * 
	 * @param basePath
	 *            基本路径
	 * @param url
	 *            请求的地址
	 * @param nav
	 *            导航参数
	 * @param type
	 *            类型
	 * @return 返回解析拼接后的URL地址链接
	 */
	public static String getResolveNavTabIdUrl(String basePath, String url, String nav, String type) {
		if (StringUtils.equals(type, "EXTERNAL")) {
			return url;
		}
		url = url.indexOf("?") > 0 ? url + "&navTabId=" + nav : url + "?navTabId=" + nav;
		return basePath + url;

	}

	/**
	 * 【图片预览】通过图片地址调用imgView预览框
	 * 
	 * @param basePath
	 *            基本路径
	 * @param filePath
	 *            文件路径
	 * @return String HTML链接字符串
	 */
	public static String showImgView(String basePath, String filePath) {
		if (ValidatorUtils.isEmpty(filePath)) {
			return "<font color=\"red\">未上传</font>";
		}
		return "<a href=\"" + basePath + "/admin/imgView/index2.do?navTabId=imgView&filePath=" + filePath
				+ "\" target=\"dialog\" width=\"300\" height=\"280\" title=\"图片预览\"><font color=\"green\">可预览</font></a>";
	}

	/**
	 * 【视频预览】通过视频地址调用imgView预览框
	 * 
	 * @param basePath
	 *            基本路径
	 * @param filePath
	 *            文件路径
	 * @return String HTML链接字符串
	 */
	public static String showVideoView(String basePath, String filePath) {
		if (ValidatorUtils.isEmpty(filePath)) {
			return "<font color=\"red\">未上传</font>";
		}
		return "<a href=\"" + basePath + "/admin/imgView/index2.do?navTabId=imgView&filePath=" + filePath
				+ "\" target=\"dialog\" width=\"300\" height=\"280\" title=\"视频预览\"><font color=\"green\">可预览</font></a>";
	}

	/**
	 * 【多选框】根据参数判断该id是否被选中（用于判断checkbox是否被选择）
	 * 
	 * @param id
	 *            被选择的多选框ID
	 * @param objIds
	 *            多选框ID集合
	 * @return String 返回checked字符串
	 */
	public static String isCheckedById(String id, String objIds) {
		if (StringUtils.isEmpty(objIds) || StringUtils.isEmpty(id)) {
			return "";
		} else {
			if (org.apache.commons.lang.StringUtils.contains(objIds, id)) {
				return "checked";
			} else {
				return "";
			}
		}
	}

	/**
	 * 【中文未填】根据对象是否为空显示字符是否填写
	 * 
	 * @param obj
	 *            需要转换的对象
	 * @return String
	 */
	public static String showStringIsEmpty(Object obj) {
		if (ValidatorUtils.isEmpty(obj) || StringUtils.equals(obj.toString(), "0")) {
			return "未填";
		}
		return obj.toString();
	}

	/**
	 * 【中文是否】根据数字获取中文是或否HTML字符串
	 * 
	 * @param number
	 *            数字
	 * @param type
	 *            显示类型(text|html)
	 * @return String 是否的字符串（可以是文本或HTML标签）
	 */
	public static String getNumberToYesOrNO(Integer number, String type) {
		if (StringUtils.equals(type, "html")) {
			return number != null && number > 0 ? "<span style='color:green;line-height:21px;'>是</span>"
					: "<span style='color:gray;line-height:21px;'>否</span>";
		} else if (StringUtils.equals(type, "text")) {
			return number != null && number > 0 ? "是" : "否";
		}
		return number.toString();
	}

	/**
	 * 【中文是否】根据数字显示是否字符串
	 * 
	 * @param number
	 *            0或1的数字
	 * @return String 是否的字符串（纯文字）
	 */
	public static String isTrueOrFalse(Integer number) {
		return number != null && number > 0 ? "是" : "否";
	}

	/**
	 * 【中文是否】根据数字显示员工在职或离职
	 * 
	 * @param number
	 *            0或1的数字 0离职 1在职
	 * @return String 是否的字符串（纯文字）
	 */
	public static String getSaleJobStatus(Integer jobStatus) {
		return jobStatus != null && jobStatus > 0 ? "在职" : "离职";
	}

	/**
	 * 【房东模块】判断最后处理日期是否为空
	 *
	 */
	public static String dealLastInputTime(Date lastInputTime) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String strDate = null;
		if (lastInputTime != null) {
			strDate = df.format(lastInputTime);
		}
		return strDate;
	}

	/**
	 * 【房东模块】判断最后处理日期是否为空
	 *
	 */
	public static String dealInputTime(Date inputTime) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String strDate = null;
		if (inputTime != null) {
			strDate = df.format(inputTime);
		}
		return strDate;
	}

	/**
	 * 【审核】根据数字显示审核字符串
	 * 
	 * @param number
	 *            0或1的数字
	 * @return String 已审核或未审核的字符串（纯文字）
	 */
	public static String isVerify(Integer number) {
		return number != null && number > 0 ? "已审核" : "未审核";
	}

	/**
	 * 【Tonken标识符】生成Token字符串
	 * 
	 * @return String token字符串
	 */
	public static String createToken() {
		return Md5Utils.toMD5(toTime().toString());
	}

	/**
	 * 【版本号】用于刷新页面JS及CSS样式
	 * 
	 * @return String 页面JS及CSS样式版本号
	 */
	public static String getVersionCode() {
		return "20150810";
	}

	/**
	 * 【URL地址】生成Url参数
	 * 
	 * @param param
	 * @param value
	 * @return
	 */
	public static String createUrl(String param, String value) {
		if (ValidatorUtils.isNotEmpty(value)) {
			return "&" + param + "=" + value;
		} else {
			return "";
		}

	}

	/**
	 * 【格式化】将对象转换成字符串，如果为空则显示默认字符串
	 * 
	 * @param obj
	 *            需要转换的对象
	 * @param defaultObj
	 *            默认字符串
	 * @return String 返回字符串
	 */
	public static String toDefaultObj(Object obj, String defaultObj) {
		if (ValidatorUtils.isEmpty(obj)) {
			return defaultObj;
		}
		return obj.toString();
	}

	// ==============================================================支持DWZ框架的基础工具方法函数======================END===================================================

	// ==============================================================与日期相关的函数======================START=================================================

	/**
	 * 得到本周周一
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getMondayOfThisWeek(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 1);
		return sdf.format(c.getTime());
	}

	/**
	 * 得到本周周日
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getSundayOfThisWeek(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 7);
		return sdf.format(c.getTime());
	}

	/**
	 * 得到上周周一
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getMondayOfLastWeek(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, -7);
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 1);
		return sdf.format(c.getTime());
	}

	/**
	 * 得到上周周日
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getSundayOfLastWeek(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, -7);
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 7);
		return sdf.format(c.getTime());
	}

	/**
	 * 得到本月月初
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getFirstDayOfThisMonth(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, 1);

		return sdf.format(c.getTime());
	}

	/**
	 * 得到本月月末
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getLastDayOfThisMonth(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));

		return sdf.format(c.getTime());
	}

	/**
	 * 得到上月月初
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getFirstDayOfLastMonth(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, -1);
		c.set(Calendar.DAY_OF_MONTH, 1);

		return sdf.format(c.getTime());
	}

	/**
	 * 得到上月月末
	 * 
	 * @return 按输入参数中的格式化后的日期
	 */
	public static String getLastDayOfLastMonth(Date date, String dateFmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, -1);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));

		return sdf.format(c.getTime());
	}

	// ==============================================================与日期相关的函数======================END===================================================

	// ==============================================================与通用业务相关的函数======================BEGIN===================================================
	/**
	 * 【订单业务】根据日期获取编号
	 * 
	 * @return
	 */

	public static String getDateNumber() {
		DateNumberService dateNumberService = (DateNumberService) BaseSpringContextSupport.getApplicationContext()
				.getBean("dateNumberService");
		return dateNumberService.getDateNumber();
	}

}
