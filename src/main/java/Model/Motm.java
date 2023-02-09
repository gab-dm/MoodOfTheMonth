package Model;

public class Motm {
    private static String subject = "No subject";
    private static String content = "No content";
    private static String motm = "No motm";

    public Motm() {
    }

    public String getSubject() {
        return subject;
    }

    public String getContent() {
        return content;
    }

    public String getMotm() {
        return motm;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setMotm(String motm) {
        this.motm = motm;
    }
}
