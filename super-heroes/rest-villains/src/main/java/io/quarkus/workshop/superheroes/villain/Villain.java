package io.quarkus.workshop.superheroes.villain;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.Random;

@Entity
public class Villain extends PanacheEntity {

    private static final Random RANDOM = new Random();

    @NotNull
    @Size(min = 3, max = 50)
    public String name;

    public String otherName;

    @NotNull
    @Min(1)
    public int level;

    public String picture;

    @Column(columnDefinition = "TEXT")
    public String powers;

    public static Villain findRandom() {
        long countVillains = count();
        int randomVillain = RANDOM.nextInt((int) countVillains);
        return findAll().page(randomVillain, 1).firstResult();
    }

    @Override
    public String toString() {
        return "Villain{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", otherName='" + otherName + '\'' +
            ", level=" + level +
            ", picture='" + picture + '\'' +
            ", powers='" + powers + '\'' +
            '}';
    }
}
