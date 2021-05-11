package working_government;


public class listing {
private int user_id;
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}

private String location_name;
private String property_type;
private String description;

public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}

public String getLocation_name() {
	return location_name;
}
public void setLocation_name(String location_name) {
	this.location_name = location_name;
}
public String getProperty_type() {
	return property_type;
}
public void setProperty_type(String property_type) {
	this.property_type = property_type;
}

@Override
public String toString() {
	return "listing [location_name=" + location_name + ", property_type=" + property_type + ", description="
			+ description + ", user_id=" + user_id + "]";
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((property_type == null) ? 0 : property_type.hashCode());
	result = prime * result + ((location_name == null) ? 0 : location_name.hashCode());
	result = prime * result + ((description == null) ? 0 : description.hashCode());

	result = prime * result + user_id;
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	listing other = (listing) obj;
	if (property_type == null) {
		if (other.property_type != null)
			return false;
	} else if (!location_name.equals(other.location_name))
		return false;
	if (description == null) {
		if (other.description != null)
			return false;
	} else if (!description.equals(other.description))
		return false;
	if(location_name == null) {
		if (other.location_name !=null)
			return false;
	}
	if (user_id != other.user_id)
		return false;
	return true;
}

}

