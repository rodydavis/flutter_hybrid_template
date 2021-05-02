import { html, css, LitElement } from "lit";
import { customElement, property } from "lit/decorators.js";

@customElement("my-app")
export class MyApp extends LitElement {
  static styles = css`
    p {
      color: blue;
    }
  `;

  @property()
  name = "Somebody";

  render() {
    return html`<div>
      <p>Hello, ${this.name}!</p>
      <slot></slot>
    </div>`;
  }
}
