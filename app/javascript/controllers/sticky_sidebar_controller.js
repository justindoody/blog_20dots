import { bool } from "assert-plus";
import { Controller } from "stimulus"

export default class extends Controller {
    static values = { scrolledPastHeader: Boolean }

    initialize() {
        this.scrolledPastHeaderValue = false;
    }

    onScroll(event) {
        const windowHeight = window.innerHeight;
        const headerHeight = windowHeight / 2;
        const scrolledY = window.scrollY;
        const postContent = this.element.nextElementSibling;

        if (!this.isPastWindowWidthMd()) {
            this.element.style.position = 'relative';
            this.element.style.top = '';
            return;
        }

        if((scrolledY > headerHeight) && this.isPastWindowWidthMd()) {
            if(this.scrolledPastHeaderValue == false) {
                this.element.style.position = 'fixed';
                this.element.style.top = '0';
                postContent.classList.add('md:pl-sidebar');
                this.scrolledPastHeaderValue = true;
            }

        } else {
            if(this.scrolledPastHeaderValue == true) {
                this.element.style.position = 'static';
                this.element.style.top = '';
                postContent.classList.remove('md:pl-sidebar');
                this.scrolledPastHeaderValue = false;
            }
        }

    }

    isPastWindowWidthMd(){
        const windowWidth = window.innerWidth;
        const windowWidthMd = 768;
        return windowWidth > windowWidthMd
    }
}