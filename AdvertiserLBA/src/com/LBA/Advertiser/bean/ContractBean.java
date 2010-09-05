package com.LBA.Advertiser.bean;

import java.sql.Date;

public class ContractBean {

	public String contractID;
	public String contractname;
	public String advertiserID;
	public String description;
	public String space;
	public String startdate;
	public String enddate;
	public String getContractID() {
		return contractID;
	}
	public void setContractID(String contractID) {
		this.contractID = contractID;
	}
	public String getContractname() {
		return contractname;
	}
	public void setContractname(String contractname) {
		this.contractname = contractname;
	}
	public String getAdvertiserID() {
		return advertiserID;
	}
	public void setAdvertiserID(String advertiserID) {
		this.advertiserID = advertiserID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSpace() {
		return space;
	}
	public void setSpace(String space) {
		this.space = space;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
}