package com.house.business.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.iframework.support.spring.hibernate.model.BaseHibernateModelSupport;

/**
 * 省份
 * 
 * @author wangchaoqun
 * @date 2017年8月15日 上午10:10:27
 */
@Entity
@Table(name = "province")
@org.hibernate.annotations.Table(appliesTo = "province", comment = "省份")
public class Province extends BaseHibernateModelSupport {

	private static final long serialVersionUID = 7391753502445125059L;
	/**
	 * 省份名称
	 */
	@Column(columnDefinition = "varchar(32)  comment '省份名称'")
	private String provinceName;

	/**
	 * 省份id
	 */
	@Column(columnDefinition = "varchar(32)  comment '省份ID'")
	private String provinceId;
	/**
	 * 省份简称
	 */
	@Column(columnDefinition = "varchar(32)  comment '省份简称'")
	private String provinceShort;

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getProvinceShort() {
		return provinceShort;
	}

	public void setProvinceShort(String provinceShort) {
		this.provinceShort = provinceShort;
	}

	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

}
