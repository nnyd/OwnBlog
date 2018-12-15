package top.nanclub.share.bean;

import java.util.*;

public class Article {
    private Integer aid;
    private String title;
    private String content;
    private String explain;
    private String label;
    private Date createTime;
    private Integer accid;
    private Integer clicks;
    private String imgAddress;

    private String aname;
    private List<String> labels;
    private Map<String, Article> more;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
        String[] labels = label.split(";");
        this.labels = new ArrayList<>(Arrays.asList(labels));
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getAccid() {
        return accid;
    }

    public void setAccid(Integer accid) {
        this.accid = accid;
    }

    public Integer getClicks() {
        return clicks;
    }

    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    public String getImgAddress() {
        return imgAddress;
    }

    public void setImgAddress(String imgAddress) {
        this.imgAddress = imgAddress;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public Map<String, Article> getMore() {
        return more;
    }

    public void setMore(Map<String, Article> more) {
        this.more = more;
    }

    public Article getMoreInfo(String flag) {
        return more.get(flag);
    }

    public void setMoreInfo(String flag, Article article) {
        if (this.more == null)
            more = new HashMap<>();
        this.more.put(flag, article);
    }
}
