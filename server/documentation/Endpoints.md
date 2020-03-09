# Endpoints

These are a collection of endpoints to be used in the March 2020 Learn Swift
Boston session on concurrency. They are broken down by topic.

## Networking
`GET /quote`

Returns one of four quotes, randomly.
<details>
 <summary>Example Response</summary>

```json
{
  "quote": "Ob la di, ob-la-da",
  "author": "Paul McCartney"
}
```

</details>

---

## Dispatch Groups
`GET /product/:productId`

Returns a product for the given product ID (always Purell).
<details>
 <summary>Example Response</summary>

```json
{
  "id": "123",
  "name": "Marshmallow Fluff",
  "description": "Delicious sandwich spread created in Somerville, MA.",
  "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Marshmallow_fluff2.jpg/250px-Marshmallow_fluff2.jpg"
}
```
</details>

&nbsp;

`GET /inventory/:productId`

Returns the available inventory for the given product ID (random number 1-10).
<details>
 <summary>Example Response</summary>

```json
{
  "productId": "123",
  "stock": 1
}
```

</details>
