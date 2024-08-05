<script lang="ts">
    import { PLAYER } from "@store/player";

    let quotes = {
        leo: [
            'Politiet, hvor du blir hatet uansett hva du gjør',
            'D-Mail kan reise til helvete.',
            'Leser noen disse?',
            'Lars er uskyldig.',
            '"Skyt først og spør etterpå"',
            'Fakta: Det var Hugo som brente ned sykehuset',
            'Spesialenheten? Mer som pensjonistenheten!',
            'Jimmy Varco; etterlyst siden tidenes morgen.',
            'Roggis var her',
            'Burge er overrated.',
            'Krølltoppen gir 10%, uansett.',
            'Politiet er bare et sykt maktspill',
            'Husk: folk vi pågriper har rettighter! (tror jeg?)',
        ],
        ems: [
            'D-Mail kan reise til helvete.',
            'Leser noen disse?',
            'Fakta: Det var Hugo som brente ned sykehuset',
        ],
        doj: [
            'D-Mail kan reise til helvete.',
            'Leser noen disse?',
        ]
    };

    let quote = quotes[$PLAYER.job.type][Math.floor(Math.random() * quotes[$PLAYER.job.type].length)];
</script>

<div class="h-full flex items-center justify-center gap-[1vh] pl-[3vh] font-medium text-[1.7vh] text-gray-500">
    <i class="fas fa-quote-left -mt-[1vh]" />
    <h1>
        {quote}
    </h1>
    <i class="fas fa-quote-right mt-[1vh]" />
</div>
