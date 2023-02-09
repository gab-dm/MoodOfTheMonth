package Model;

public class Mood {
    private Integer mark;
    private String comment;
    private String publicly;

    public Mood(Integer mark, String comment, String publicly) {
        this.mark = mark;
        this.comment = comment;
        this.publicly = publicly;
    }

    public Integer getMark() {
        return mark;
    }

    public String getComment() {
        return comment;
    }

    public String getPublicly() {
        return publicly;
    }
}
