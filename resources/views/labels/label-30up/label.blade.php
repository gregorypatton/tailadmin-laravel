 @if(is_null($product))
 <div class='blank'></div>
 @else
 <div class='label'>
        @if ($currentIndex == 0 && $product->isHideUpc())
            <div class="instructions">HIDE UPC</div>
        @endif
        @if ($product->isKit())
            <div class='kit'>KIT</div>
        @endif
        <h1> {{ $product->sku }} </h1>

        <div class='f_right'>
            {{ $product->barcode }}
            @if ($product->idType == 'UPC')
                <div class='fnsku'>{{ $product->id }}</div>
            @else
                <div class='fnsku'>{{ $product->fnsku }}</div>
            @endif

            <div class='title'>{{ Str::of($product->title)->words(10, '...') }}</div>

            <div class="bottom">
                @if ($product->idType !== 'UPC')
                    <div class='condition'>New</div>
                @endif


                @if ($product->brand == 'ResOne')
                    @if ($product->isKit())
                        <div class='tm'>Sold by <span class='doner'>Doner Medical</span></div>
                    @else
                        <div class='tm'>Manufactured for <span class='doner'>ResOne</span></div>
                    @endif
                @else
                    <div class='tm'>Sold by <span class='doner'>Doner Medical</span></div>
                @endif
            </div>
        </div>
    </div>
@endif
