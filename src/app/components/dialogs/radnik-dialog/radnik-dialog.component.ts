import { ERROR_COMPONENT_TYPE } from '@angular/compiler';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { error } from 'selenium-webdriver';
import { Obrazovanje } from 'src/app/models/obrazovanje';
import { Radnik } from 'src/app/models/radnik';
import { ObrazovanjeService } from 'src/app/services/obrazovanje.service';
import { RadnikService } from 'src/app/services/radnik.service';

@Component({
  selector: 'app-radnik-dialog',
  templateUrl: './radnik-dialog.component.html',
  styleUrls: ['./radnik-dialog.component.css']
})
export class RadnikDialogComponent implements OnInit {

  obrazovanja: Obrazovanje[];
  public flag: number;

  constructor(public snackBar: MatSnackBar,
              public dialogRef: MatDialogRef<RadnikDialogComponent>,
              @Inject(MAT_DIALOG_DATA) public data: Radnik,
              public radnikService: RadnikService,
              public obrazovanjeService: ObrazovanjeService) { }

  ngOnInit(): void {
    this.obrazovanjeService.getAllObrazovanjes()
    .subscribe(obrazovanja => {
      this.obrazovanja = obrazovanja;
    }),
    (error: Error) => {
      console.log(error.name + ' ' + error.message);
    }
  }

  compareTo(a, b) {
    return a.id === b.id;
  }

  public add(): void {
    this.radnikService.addRadnik(this.data)
    .subscribe(() => {
      this.snackBar.open('Uspešno dodat radnik: ' + this.data.ime, 'U redu', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name + '---->' + error.message)
      this.snackBar.open('Dogodila se greška. Pokušajte ponovo!', 'Zatvori', {
        duration: 2500
      });
    };
  }

  public update(): void {
    this.radnikService.updateRadnik(this.data)
      .subscribe(() => {
        this.snackBar.open('Uspešno modifikovan radnik: ' + this.data.ime, 'U redu', {
          duration: 2500
        });
      }),
      (error: Error) => {
        console.log(error.name + '---->' + error.message)
        this.snackBar.open('Dogodila se greška. Pokušajte ponovo!', 'Zatvori', {
          duration: 2500
        });
      };
  }

  public delete(): void {
    this.radnikService.deleteRadnik(this.data.id)
      .subscribe(() => {
        this.snackBar.open('Uspešno obrisan radnik', 'U redu', {
          duration: 2500
        });
      }),
      (error: Error) => {
        console.log(error.name + '---->' + error.message)
        this.snackBar.open('Dogodila se greška. Pokušajte ponovo!', 'Zatvori', {
          duration: 2500
        });
      };
  }

  public cancel(): void {
    this.dialogRef.close();
    this.snackBar.open('Odustali ste od izmena!', 'U redu', {
      duration: 1000
    });
  }

}