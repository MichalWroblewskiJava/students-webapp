package pl.sda.javagdy2.database.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Student implements IBaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String imie;
    private String nazwisko;
    private boolean pelnoletni;
    private double wzrost;


    @OneToMany(fetch = FetchType.EAGER, mappedBy = "student")
    private List<Grade> gradeList;


}
