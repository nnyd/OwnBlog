package top.nanclub.share.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.nanclub.share.bean.Article;
import top.nanclub.share.bean.Record;
import top.nanclub.share.services.inte.IBaseService;

import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller("baseController")
public class BaseController {

    @Autowired
    private IBaseService baseService;

    @RequestMapping("/about")
    public ModelAndView about() {
        return new ModelAndView("base/about");
    }

    @RequestMapping("/index")
    public ModelAndView goIndex() {
        ModelAndView mav = new ModelAndView("index");
        //贴内容最新5条
        List<Article> new5 = baseService.getArticleNew5();
        //点击排行
        List<Article> top5 = baseService.getArticleClicksTop5();

        mav.addObject("articles", new5);
        mav.addObject("top", top5);
        return mav;
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView goDetail(@PathVariable("id") Integer id) {
        ModelAndView mav = new ModelAndView("article/detail");
        Article article = baseService.getDetail(id);
        List<Article> top5 = baseService.getArticleClicksTop5();
        mav.addObject("top", top5);
        mav.addObject("data", article);
        return mav;
    }

    @RequestMapping("/mood")
    public ModelAndView getMood() {
        ModelAndView mav = new ModelAndView("base/mood");
        List<Record> data = baseService.getMood();
        mav.addObject("data", data);
        return mav;
    }

    @RequestMapping("/article")
    public ModelAndView getAllArticles() {
        return getArticles(null);
    }

    @RequestMapping("/article/{label}")
    public ModelAndView getArticles(@PathVariable(value = "label", required = false) String label) {
        ModelAndView mav = new ModelAndView("article/article");
        if (!StringUtils.isEmpty(label)) {
            System.out.println(label);
            String s = new String(label.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            if (label.length() != (s.length())) {
                label = s;
            }
            System.out.println(label);
        } else {
            label = null;
        }
        //所有标签
        List<String> labels = baseService.getAllLabel();
        if (!StringUtils.isEmpty(label)) {
            if (!labels.contains(label)) {
                throw new RuntimeException("没有这样的标签!");
            }
        }
        //所有贴
        List<Article> AllArticle = baseService.getAllArticle(label);
        //点击排行
        List<Article> top5 = baseService.getArticleClicksTop5();
        mav.addObject("articles", AllArticle);
        mav.addObject("top", top5);
        mav.addObject("labels", labels);
        mav.addObject("lab", label);
        return mav;
    }

}
