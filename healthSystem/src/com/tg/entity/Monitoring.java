package com.tg.entity;

//���˼������ģ��
public class Monitoring {
	private int m_id;
	private int u_id;
	private int d_id;
	private int highpressure;
	private int lowpressure;
	private double temperature;
	private int pulse;
	private String ecg;
	private int warning;
	private String m_date;
	public Monitoring() {
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public int getHighpressure() {
		return highpressure;
	}
	public void setHighpressure(int highpressure) {
		this.highpressure = highpressure;
	}
	public int getLowpressure() {
		return lowpressure;
	}
	public void setLowpressure(int lowpressure) {
		this.lowpressure = lowpressure;
	}
	public double getTemperature() {
		return temperature;
	}
	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}
	public int getPulse() {
		return pulse;
	}
	public void setPulse(int pulse) {
		this.pulse = pulse;
	}
	public String getEcg() {
		return ecg;
	}
	public void setEcg(String ecg) {
		this.ecg = ecg;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	@Override
	public String toString() {
		return "Monitoring [m_id=" + m_id + ", u_id=" + u_id + ", d_id=" + d_id
				+ ", highpressure=" + highpressure + ", lowpressure="
				+ lowpressure + ", temperature=" + temperature + ", pulse="
				+ pulse + ", ecg=" + ecg + ", warning=" + warning + ", m_date="
				+ m_date + "]";
	}
	
}
