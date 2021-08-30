package entity;

public class User {
    private Integer userId;

    private String uname;

    private String passwd;

    private Integer question;

    private String da;

    private Integer cout;

    private Integer urole;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }

    public Integer getQuestion() {
        return question;
    }

    public void setQuestion(Integer question) {
        this.question = question;
    }

    public String getDa() {
        return da;
    }

    public void setDa(String da) {
        this.da = da == null ? null : da.trim();
    }

    public Integer getCout() {
        return cout;
    }

    public void setCout(Integer cout) {
        this.cout = cout;
    }

    public Integer getUrole() {
        return urole;
    }

    public void setUrole(Integer urole) {
        this.urole = urole;
    }
}