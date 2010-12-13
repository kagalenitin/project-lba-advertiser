package com.LBA.Advertiser.bean;


public class ContractBean {

	public String contractID;
	public String contractname;
	public String contractcreatedby;
	public String contractdate;
	public String username;
	public String space;
	public String startdate;
	public String enddate;
	public String duration;
	public String paymenttype;

	public String getContractdate() {
		return contractdate;
	}

	public void setContractdate(String contractdate) {
		this.contractdate = contractdate;
	}

	public String status;

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	public String getContractname() {
		return contractname;
	}

	public void setContractname(String contractname) {
		this.contractname = contractname;
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

	public String getContractcreatedby() {
		return contractcreatedby;
	}

	public void setContractcreatedby(String contractcreatedby) {
		this.contractcreatedby = contractcreatedby;
	}

	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}
}