import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "headerImage", "title", "titleWrapper" ]

    adjustOpacity(_event) {
        const windowHeight = window.innerHeight;
        const headerHeight = windowHeight / 2;
        const scrolledY = window.scrollY;

        // Don't adjust once header is no longer visible
        if (scrolledY > headerHeight) return;

        const maxOpacity = 1;
        // Speed up rate of opacity reduction
        const accelerationFactor = 2;

        const newOpacity = maxOpacity - ((scrolledY * accelerationFactor) / headerHeight);

        this.headerImageTarget.style.opacity = Math.max(0, newOpacity);
    }

    adjustTitleHeight(_event) {
        const windowHeight = window.innerHeight;
        const headerHeight = windowHeight / 2;
        const scrolledY = window.scrollY;
        const titleHeight = this.titleTarget.offsetHeight;
        const visibleContainerHeight = headerHeight - scrolledY;

        if (visibleContainerHeight >= titleHeight) {
            this.titleWrapperTarget.style.height = `${visibleContainerHeight}px`;
        }
    }
}