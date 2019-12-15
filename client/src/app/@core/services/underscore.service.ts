import {Injectable} from '@angular/core';
import {DomSanitizer} from '@angular/platform-browser';

@Injectable({
    providedIn: 'root'
})
export class UnderscoreService {
    constructor(private sanitizer: DomSanitizer) {
    }

    base64(file: File) {
        return new Promise((resolve, reject) => {
            const reader: any = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => {
                // let encoded = reader.result.replace(/^data:(.*;base64,)?/, '');
                const encoded = reader.result;
                /* if ((encoded.length % 4) > 0) {
                  encoded += '='.repeat(4 - (encoded.length % 4));
                } */
                resolve(encoded);
            };
            reader.onerror = error => reject(error);
        });
    }

    ArrayDuplicatedItems(array: any[]) {
        let object = {}, result = [];

        array.forEach(function (item) {
            if (!object[item]) { object[item] = 0; }
            object[item] += 1;
        });

        for (let prop in object) {
            if (object[prop] >= 2) {
                result.push(prop);
            }
        }

        return result;
    }

    dateDiffInDay(date1, date2) {
        let dt1 = new Date(date1);
        let dt2 = new Date(date2);
        return Math.floor(
            (Date.UTC(dt2.getFullYear(), dt2.getMonth(), dt2.getDate()) -
                Date.UTC(dt1.getFullYear(), dt1.getMonth(), dt1.getDate())) /
            (1000 * 60 * 60 * 24)
        );
    }

    makeid(length) {
        let result = '';
        let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';
        let charactersLength = characters.length;
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }

    sanitize(value: any): any {
        return this.sanitizer.bypassSecurityTrustHtml(value);
    }

    convertJsontoFormData(jsonObject: Object, parentKey = undefined, carryFormData: FormData = undefined): FormData {
        const formData = carryFormData || new FormData();
        let index = 0;

        for(let key in jsonObject) {
            if (jsonObject.hasOwnProperty(key)) {
                if (jsonObject[key] !== null && jsonObject[key] !== undefined) {
                    let propName = parentKey || key;
                    if (parentKey && this.isObject(jsonObject)) {
                        propName = parentKey + '[' + key + ']';
                    }
                    if (parentKey && this.isArray(jsonObject)) {
                        propName = parentKey + '[' + index + ']';
                    }
                    if (jsonObject[key] instanceof File) {
                        formData.append(propName, jsonObject[key]);
                    } else if (jsonObject[key] instanceof FileList) {
                        for (let j = 0; j < jsonObject[key].length; j++) {
                            formData.append(propName + '[' + j + ']', jsonObject[key].item(j));
                        }
                    } else if (this.isArray(jsonObject[key]) || this.isObject(jsonObject[key])) {
                        this.convertJsontoFormData(jsonObject[key], propName, formData);
                    } else if (typeof jsonObject[key] === 'boolean') {
                        formData.append(propName, +jsonObject[key] ? '1' : '0');
                    } else {
                        formData.append(propName, jsonObject[key]);
                    }
                }
            }
            index++;
        }
        return formData;
    }

    isArray(val) {
        const toString = ({}).toString;
        return toString.call(val) === '[object Array]';
    }

    isObject(val) {
        return !this.isArray(val) && typeof val === 'object' && !!val;
    }
}
