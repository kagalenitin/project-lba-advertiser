package com.LBA.Advertiser.bean;

import java.util.Date;

public class ContractBean {

	public String contractID;
	public String username;
	public String space;
	public String startdate;
	public String enddate;
	public String duration;
	public String status;
    /**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getContractID() {
		return contractID;
	}
	public void setContractID(String contractID) {
		this.contractID = contractID;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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