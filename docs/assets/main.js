import{r as e,e as t,n as r,h as o,T as n}from"./vendor.js";!function(e=".",t="__import__"){try{self[t]=new Function("u","return import(u)")}catch(r){const o=new URL(e,location),n=e=>{URL.revokeObjectURL(e.src),e.remove()};self[t]=e=>new Promise(((r,s)=>{const l=new URL(e,o);if(self[t].moduleMap[l])return r(self[t].moduleMap[l]);const p=new Blob([`import * as m from '${l}';`,`${t}.moduleMap['${l}']=m;`],{type:"text/javascript"}),a=Object.assign(document.createElement("script"),{type:"module",src:URL.createObjectURL(p),onerror(){s(new Error(`Failed to import: ${e}`)),n(a)},onload(){r(self[t].moduleMap[l]),n(a)}});document.head.appendChild(a)})),self[t].moduleMap={}}}("/flutter_hybrid_template/assets/");var s=Object.defineProperty,l=Object.getOwnPropertyDescriptor,p=(e,t,r,o)=>{for(var n,p=o>1?void 0:o?l(t,r):t,a=e.length-1;a>=0;a--)(n=e[a])&&(p=(o?n(t,r,p):n(p))||p);return o&&p&&s(t,r,p),p};let a=class extends o{constructor(){super(...arguments),this.name="Somebody"}render(){return n`<div>
      <p>Hello, ${this.name}!</p>
      <slot></slot>
    </div>`}};a.styles=e`
    p {
      color: blue;
    }
  `,p([t()],a.prototype,"name",2),a=p([r("my-app")],a);
