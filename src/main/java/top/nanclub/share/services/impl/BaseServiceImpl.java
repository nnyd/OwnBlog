package top.nanclub.share.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import top.nanclub.share.bean.Article;
import top.nanclub.share.bean.Record;
import top.nanclub.share.mapper.BaseMapper;
import top.nanclub.share.services.inte.IBaseService;

import java.util.List;
import java.util.stream.Collectors;

@Service("baseService")
@Transactional
public class BaseServiceImpl implements IBaseService {

    @Autowired
    private BaseMapper baseMapper;

    @Override
    public Article getDetail(Integer id) {
        Article article = baseMapper.getDetail(id);
        if (article == null)
            return null;
        List<Article> more = baseMapper.getMore(id);
        if (more != null && more.size() > 0) {
            for (Article a : more) {
                if (a.getAid() > id) {
                    article.setMoreInfo("next", a);
                } else {
                    article.setMoreInfo("last", a);
                }
            }
        }
        //更新访问量
        Integer clicks = article.getClicks() + 1;
        article.setClicks(clicks);
        baseMapper.plusClicks(id, clicks);
        return article;
    }

    @Override
    public List<Record> getMood() {
        return baseMapper.getMood();
    }

    @Override
    public List<Article> getArticleNew5() {
        return baseMapper.getArticleNew5();
    }

    @Override
    public List<Article> getArticleClicksTop5() {
        return baseMapper.getArticleClicksTop5();
    }

    @Override
    public List<Article> getAllArticle(String label) {
        List<Article> allArticle = baseMapper.getAllArticle();
        if (!StringUtils.isEmpty(label)) {
            allArticle = allArticle.stream().filter(a -> a.getLabels().contains(label)).collect(Collectors.toList());
        }
        return allArticle;
    }

    @Override
    public List<String> getAllLabel() {
        return baseMapper.getAllLabel();
    }
}
