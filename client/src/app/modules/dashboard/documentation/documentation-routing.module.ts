import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DocumentationComponent } from '@app/modules/dashboard/documentation/documentation.component';

const routes: Routes = [
  {
    path: '',
    component: DocumentationComponent,
    data: {
      title: 'Documentation'
    },

  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class DocumentationRoutingModule { }
