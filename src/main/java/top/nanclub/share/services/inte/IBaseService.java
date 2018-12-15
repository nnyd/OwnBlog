package top.nanclub.share.services.inte;

import top.nanclub.share.bean.Article;
import top.nanclub.share.bean.Record;

import java.util.List;

public interface IBaseService {

    Article getDetail(Integer id);

    List<Record> getMood();

    List<Article> getArticleNew5();

    List<Article> getArticleClicksTop5();

    List<Article> getAllArticle(String label);

    List<String> getAllLabel();
}
