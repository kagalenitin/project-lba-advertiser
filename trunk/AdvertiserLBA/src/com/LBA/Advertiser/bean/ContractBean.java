package com.LBA.Advertiser.bean;

import java.util.Date;

public class ContractBean {

	public String contractID;
	public String advertiserID;
	public String space;
	public String startdate;
	public String enddate;
	
    public String getContractID() {
		return contractID;
	}
	public void setContractID(String contractID) {
		this.contractID = contractID;
	}
	

	public String getAdvertiserID() {
		return advertiserID;
	}
	public void setAdvertiserID(String advertiserID) {
		this.advertiserID = advertiserID;
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
	public void setStartdate(String string) {
		this.startdate = string;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String string) {
		this.enddate = string;
	}
}