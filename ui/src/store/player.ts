import { writable } from "svelte/store";

export const PLAYER = writable<PLAYER_DATA>();

interface PLAYER_DATA {
    source: number;
    citizenid: string;
    job: {
        isboss: boolean;
        payment: number;
        grade: {
            level: number;
            name: string;
        };
        type: string;
        onduty: boolean;
        label: string;
        name: string;
    };
    charinfo: {
        lastname: string;
        firstname: string;
        gender: number;
        birthdate: string;
        phone: string;
        cid: string;
    };
    metadata: {
        callsign: string;
    };
}