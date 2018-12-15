package top.nanclub.share.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import top.nanclub.share.bean.Article;
import top.nanclub.share.bean.Record;

import java.util.List;

public interface BaseMapper {

    @Select("select a1.*,a2.aname from Article a1 left join Account a2  on a1.accid=a2.accid where a1.aid=#{aid}")
    Article getDetail(@Param("aid") Integer id);

    @Select(" (select * from Article where aid=(select MAX(aid) from Article where aid<#{aid})) " +
            " union all " +
            " (select * from Article where aid=(select MIN(aid) from Article where aid>#{aid})) ")
    List<Article> getMore(@Param("aid") Integer id);

    @Select("select r.*,a.aname from Record r left join Account a on r.accid=a.accid")
    List<Record> getMood();

    @Select("select a1.*,a2.aname from Article a1 left join Account a2  on a1.accid=a2.accid\n" +
            "order by a1.createTime desc LIMIT 5")
    List<Article> getArticleNew5();

    @Select("select a1.*,a2.aname from Article a1 left join Account a2  on a1.accid=a2.accid\n" +
            "order by a1.clicks desc LIMIT 5")
    List<Article> getArticleClicksTop5();

    @Select(" select a1.*,a2.aname from Article a1 left join Account a2  on a1.accid=a2.accid order by a1.createTime desc ")
    List<Article> getAllArticle();

    @Select(" select lname from Label where `enable`=1 ")
    List<String> getAllLabel();

    @Update(" update Article set clicks=#{clicks} where aid=#{aid} ")
    void plusClicks(@Param("aid") Integer id, @Param("clicks") Integer clicks);
}
