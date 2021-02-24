import { Controller } from "stimulus"

export default class extends Controller {
  showModal(event) {
    event.preventDefault();

    const modalNode = document.createElement('div');
    modalNode.classList.add('fixed', 'inset-0', 'w-full', 'h-full', 'flex', 'items-center', 'justify-center', 'transition', 'transition-colors', 'duration-500');
    modalNode.setAttribute('data-controller', 'contact');
    modalNode.setAttribute('data-action', 'click->contact#hideModal');
    modalNode.innerHTML = `
        <div class="modal-width bg-white p-20">
            Hit me up at justin@20dots.com
        </div>
    `;

    document.body.appendChild(modalNode);

    // The CSS transition doesn't seem to trigger if the
    // class is added immediately.
    setTimeout(() => {  modalNode.classList.add('modal-background'); }, 10);
  }

  hideModal(event) {
      this.element.remove();
  }
}
