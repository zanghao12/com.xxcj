package entity;

public class Product {
	 private Integer pid; //商品id
	    private String pimage; //商品图片
	    public Integer getPid() {
	        return pid;
	    }
	    public void setPid(Integer pid) {
	        this.pid = pid;
	    }
	    public String getPimage() {
	        return pimage;
	    }
	    public void setPimage(String pimage) {
	        this.pimage = pimage;
	    }
	    @Override
	    public String toString() {
	        return "Product [pid=" + pid + ", pimage=" + pimage + "]";
	    }
}
