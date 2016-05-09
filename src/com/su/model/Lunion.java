package com.su.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // represent a entity.
@Table(name = "lunion") // generate a table named "lunion".
public class Lunion {

	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false,updatable=false)
	private Integer id;
	
	@Column(name = "department", nullable = false)
	private String department;
	
	@Column(name = "unionname", nullable = false)
	private String unionname;
	
}
