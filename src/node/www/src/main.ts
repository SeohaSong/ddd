import "./main.scss";

console.log("this is basic http template.");


function getArray()
{
    const size = 1000000;
    const arr = new Array<number>(size);
    for (let idx = 0; idx < size; idx++)
    {
        arr[idx] = 0;
    }
    return arr;
}

const pointer = [getArray()];
document.addEventListener("click", () => {
    delete pointer[0];
});
