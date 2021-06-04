import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Component, Input, OnChanges, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { Subscription } from 'rxjs';
import { RadnikService } from 'src/app/services/radnik.service';
import { RadnikDialogComponent } from '../dialogs/radnik-dialog/radnik-dialog.component';
import { Obrazovanje } from 'src/app/models/obrazovanje';
import { Sektor } from 'src/app/models/sektor';
import { Radnik } from 'src/app/models/radnik';

@Component({
  selector: 'app-radnik',
  templateUrl: './radnik.component.html',
  styleUrls: ['./radnik.component.css']
})
export class RadnikComponent implements OnInit, OnChanges {

  displayedColumns = ['id', 'ime', 'prezime', 'brojLk', 'obrazovanje', 'sektor', 'actions'];
  dataSource: MatTableDataSource<Radnik>;
  subscription: Subscription;

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  @Input() selektovanSektor: Sektor;

  constructor(private radnikService: RadnikService,
              private dialog: MatDialog) { }

  ngOnInit(): void {
    // console.log(this.selektovanSektor);
    // this.loadData();
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  ngOnChanges(): void {
    if(this.selektovanSektor.id) {
      this.loadData();
    }
  }

  public loadData() {
    this.subscription = this.radnikService.getRadnikeZaSektor(this.selektovanSektor.id)
      .subscribe(data => {
        console.log(data);
        this.dataSource = new MatTableDataSource(data);

        // pretraga po nazivu ugnježdenog objekta
        this.dataSource.filterPredicate = (data, filter: string) => {
          const accumulator = (currentTerm, key) => {
            return key === 'obrazovanje' ? currentTerm + data.obrazovanje.naziv : currentTerm + data[key];
          };
          const dataStr = Object.keys(data).reduce(accumulator, '').toLowerCase();
          const transformedFilter = filter.trim().toLowerCase();
          return dataStr.indexOf(transformedFilter) !== -1;
        };

        // sortiranje po nazivu ugnježdenog objekta
        this.dataSource.sortingDataAccessor = (data, property) => {
          switch (property) {
            case 'artikl': return data.obrazovanje.naziv.toLocaleLowerCase();
            default: return data[property];
          }
        };

        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      }),
      (error: Error) => {
        console.log(error.name + ' ' + error.message);
      }
  }

  public openDialog(flag: number, id?: number, ime?: string, prezime?: string, brojLk? :number, obrazovanje?: Obrazovanje, sektor?: Sektor) {
    const dialogRef = this.dialog.open(RadnikDialogComponent, {
      data: {id, ime, prezime, brojLk, obrazovanje, sektor}
    });
    dialogRef.componentInstance.flag = flag;
    if(flag===1) {
      dialogRef.componentInstance.data.sektor = this.selektovanSektor;
    }
    dialogRef.afterClosed()
      .subscribe(result => {
        if(result === 1) {
          this.loadData();
        }
      })
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLocaleLowerCase();
    this.dataSource.filter = filterValue;
  }

}