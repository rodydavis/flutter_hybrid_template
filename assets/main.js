import{r as e,e as r,n as o,y as t,a as n}from"./vendor.js";!function(){const e=document.createElement("link").relList;if(!(e&&e.supports&&e.supports("modulepreload"))){for(const e of document.querySelectorAll('link[rel="modulepreload"]'))r(e);new MutationObserver((e=>{for(const o of e)if("childList"===o.type)for(const e of o.addedNodes)"LINK"===e.tagName&&"modulepreload"===e.rel&&r(e)})).observe(document,{childList:!0,subtree:!0})}function r(e){if(e.ep)return;e.ep=!0;const r=function(e){const r={};return e.integrity&&(r.integrity=e.integrity),e.referrerpolicy&&(r.referrerPolicy=e.referrerpolicy),"use-credentials"===e.crossorigin?r.credentials="include":"anonymous"===e.crossorigin?r.credentials="omit":r.credentials="same-origin",r}(e);fetch(e.href,r)}}();var i=Object.defineProperty,s=Object.getOwnPropertyDescriptor;"undefined"!=typeof require&&require;var l=(e,r,o,t)=>{for(var n,l=t>1?void 0:t?s(r,o):r,c=e.length-1;c>=0;c--)(n=e[c])&&(l=(t?n(r,o,l):n(l))||l);return t&&l&&i(r,o,l),l};let c=class extends o{constructor(){super(...arguments),this.name="Somebody"}render(){return t`<div>
      <p>Hello, ${this.name}!</p>
      <slot></slot>
    </div>`}};c.styles=e`
    p {
      color: blue;
    }
  `,l([r()],c.prototype,"name",2),c=l([n("my-app")],c);
