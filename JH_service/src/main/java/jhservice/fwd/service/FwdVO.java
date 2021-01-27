package jhservice.fwd.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class FwdVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1377993750158726713L;
	/**reqParam 요청**/
	private int reqParam;
	
	public int getReqParam() {
		return reqParam;
	}
	
	public void setReqParam(int reqParam) {
		this.reqParam = reqParam;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return ToStringBuilder.reflectionToString(this);
	}
	
	
}
