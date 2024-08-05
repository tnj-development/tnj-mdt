import { writable } from "svelte/store";

export const CAMERAS = writable<CAMERAS_DATA[]>([]);

interface CAMERAS_DATA {
    id: number;
    label: string;
    type: string;
    location: string;
    coords: {
        x: number;
        y: number;
        z: number;
    };
    img: string;
}