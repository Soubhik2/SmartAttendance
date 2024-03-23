package com.example.attendance.model;

public class JsonRes {
	private boolean error;
	private String errorMesg;
	
	public JsonRes(boolean error, String errorMesg) {
		super();
		this.error = error;
		this.errorMesg = errorMesg;
	}
	

	public boolean isError() {
		return error;
	}


	public void setError(boolean error) {
		this.error = error;
	}


	public String getErrorMesg() {
		return errorMesg;
	}


	public void setErrorMesg(String errorMesg) {
		this.errorMesg = errorMesg;
	}


	@Override
	public String toString() {
		return "JsonRes [error=" + error + ", errorMesg=" + errorMesg + "]";
	}
	
}
