package pojo;

import java.util.Objects;

public class Pic {
    private int id;
    private String name;
    private String country;
    private String position;
    private String resolution;
    private String longitude;
    private String latitude;
    private String acquisition_time;
    private String scale;

    public Pic(int id, String image_path, String country, String position, String resolution, String longitude, String latitude, String acquisition_time, String scale) {
        this.id = id;
        this.name = image_path;
        this.country = country;
        this.position = position;
        this.resolution = resolution;
        this.longitude = longitude;
        this.latitude = latitude;
        this.acquisition_time = acquisition_time;
        this.scale = scale;
    }

    public Pic() {

    }

    @Override
    public String toString() {
        return "Pic{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", position='" + position + '\'' +
                ", resolution='" + resolution + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", acquisition_time='" + acquisition_time + '\'' +
                ", scale='" + scale + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Pic)) return false;
        Pic pic = (Pic) o;
        return getId() == pic.getId() &&
                Objects.equals(getName(), pic.getName()) &&
                Objects.equals(getCountry(), pic.getCountry()) &&
                Objects.equals(getPosition(), pic.getPosition()) &&
                Objects.equals(getResolution(), pic.getResolution()) &&
                Objects.equals(getLongitude(), pic.getLongitude()) &&
                Objects.equals(getLatitude(), pic.getLatitude()) &&
                Objects.equals(getAcquisition_time(), pic.getAcquisition_time()) &&
                Objects.equals(getScale(), pic.getScale());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getCountry(), getPosition(), getResolution(), getLongitude(), getLatitude(), getAcquisition_time(), getScale());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getAcquisition_time() {
        return acquisition_time;
    }

    public void setAcquisition_time(String acquisition_time) {
        this.acquisition_time = acquisition_time;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }
}
