package com.sys.pojo;

import java.util.List;

public class DataGridResult {
	private long total;
	private List<?> rows;
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public DataGridResult(long total, List<?> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	public DataGridResult() {
		super();
	}
	@Override
	public String toString() {
		return "DataGridResult [total=" + total + ", rows=" + rows + "]";
	}
	
}
