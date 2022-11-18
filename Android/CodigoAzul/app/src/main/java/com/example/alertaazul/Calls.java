package com.example.alertaazul;

class Calls {
    private int id;
    private String type;
    private String area;
    private String origin;
    private String date;
    private String hour;
    private String attended;
    private String time;

    public Calls(int id, String type, String area, String origin, String date,String hour, String attended, String time) {
        this.id = id;
        this.type = type;
        this.area = area;
        this.origin = origin;
        this.date = date;
        this.hour = hour;
        this.attended = attended;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAttended() {
        return attended;
    }

    public void setAttended(String attended) {
        this.attended = attended;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    @Override
    public String toString() {
        if (attended.equals("ATENDIDA")){
            return type+' '+area+" EN "+origin+" EL DIA "+date+" A LAS "+hour+" - "+attended+" EN "+time+" SEGUNDOS ";
        }else{
            return type+' '+area+" EN "+origin+" EL DIA "+date+" A LAS "+hour+" - "+attended;
        }


    }
}
