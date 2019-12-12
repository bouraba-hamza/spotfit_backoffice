import { Injectable } from "@angular/core";
import { DomSanitizer } from "@angular/platform-browser";

@Injectable({
  providedIn: "root"
})
export class UnderscoreService {
  constructor(private sanitizer: DomSanitizer) {}

  base64(file: File) {
    return new Promise((resolve, reject) => {
      const reader: any = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        // let encoded = reader.result.replace(/^data:(.*;base64,)?/, '');
        let encoded = reader.result;
        /* if ((encoded.length % 4) > 0) {
          encoded += '='.repeat(4 - (encoded.length % 4));
        } */
        resolve(encoded);
      };
      reader.onerror = error => reject(error);
    });
  }

  ArrayDuplicatedItems(array: any[]) {
    let object = {},
      result = [];

    array.forEach(function(item) {
      if (!object[item]) object[item] = 0;
      object[item] += 1;
    });

    for (var prop in object) {
      if (object[prop] >= 2) {
        result.push(prop);
      }
    }

    return result;
  }

  dateDiffInDay(date1, date2) {
    var dt1 = new Date(date1);
    var dt2 = new Date(date2);
    return Math.floor(
      (Date.UTC(dt2.getFullYear(), dt2.getMonth(), dt2.getDate()) -
        Date.UTC(dt1.getFullYear(), dt1.getMonth(), dt1.getDate())) /
        (1000 * 60 * 60 * 24)
    );
  }

  makeid(length) {
    var result = "";
    var characters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }

  sanitize(value: any): any {
    return this.sanitizer.bypassSecurityTrustHtml(value);
  }

  objectToFormData(object): FormData {
    let formData = new FormData();

    for (let key in object) {
      formData.append(key, object[key]);
    }

    return formData;
  }

  buildFormData(object): FormData {
    let formData = new FormData();

    for (let key in object) {
      if (
        object &&
        typeof object === "object" &&
        !(object instanceof Date) &&
        !(object instanceof File)
      ) {
        this.buildFormData(object[key]);
      } else {
        formData.append(key, object[key]);
      }
    }

    return formData;
  }
}
