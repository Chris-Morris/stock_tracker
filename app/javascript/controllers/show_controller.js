import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

    connect() {
        const ticker = this.data.get("tickerValue")
        new TradingView.widget(
            {
                "width": "100%",
                "height": "100%",
                "symbol": ticker,
                "interval": "D",
                "timezone": "Etc/UTC",
                "theme": "light",
                "style": "1",
                "locale": "en",
                "toolbar_bg": "#f1f3f6",
                "enable_publishing": false,
                "hide_side_toolbar": false,
                "allow_symbol_change": false,
                "studies": [

                ],
                "container_id": "tradingview_b5f99"
            }
        );
    }
}