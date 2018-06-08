package bbs.model;

import java.util.Date;

public class Message {
    String title;
    Date time;
    String author;
    String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Message(String title,String author,Date time,String content){
        super();
        this.author=author;
        this.time=time;
        this.title=title;
        this.content=content;
    }
}
