package com.foodorderbe.foodorderbe_artifact.entities;

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name="shop")
public class Shop {
    @OneToOne
    @PrimaryKeyJoinColumn
    private User user;

    @Column(name = "location",nullable = false, columnDefinition = "text")
    private String location;

    @Column(name = "isValid",nullable = false, columnDefinition = "tinyint(1) default 0")
    private boolean isValid;

    @Column(name = "shipPayment",nullable = false, columnDefinition = "float default 0")
    private float shipPayment;

    @CreationTimestamp
    @Column(name = "dateCreated", nullable = false)
    private Date dateCreated;

    @CreationTimestamp
    @Column(name = "dateModified", nullable = false)
    private Date dateModified;
}